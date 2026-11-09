# Stage 1: Build stage - Compilar la aplicación Go del servicio de notificaciones
FROM golang:1.21-alpine AS builder

# Definir variables de construcción
ARG APP_NAME=notification-service
ARG VERSION=1.0.0

# Instalar dependencias necesarias para compilación
RUN apk add --no-cache git make

# Establecer directorio de trabajo
WORKDIR /build

# Copiar archivos de go.mod y go.sum para aprovechar caché de capas
COPY go.mod go.sum ./

# Descargar dependencias de Go
RUN go mod download

# Copiar código fuente de la aplicación
COPY . .

# Compilar la aplicación binaria
RUN CGO_ENABLED=0 GOOS=linux go build \
    -a -installsuffix cgo \
    -ldflags="-X main.Version=${VERSION}" \
    -o /app/notification-service \
    ./cmd/server/main.go

# Stage 2: Runtime stage - Imagen final ligera
FROM alpine:3.18

# Instalar certificado CA y herramientas básicas
RUN apk add --no-cache ca-certificates curl tzdata

# Crear usuario no root para seguridad
RUN adduser -D -g '' appuser

# Crear directorio para la aplicación
WORKDIR /app

# Copiar el binario compilado del stage anterior
COPY --from=builder /app/notification-service /app/

# Copiar scripts de healthcheck
COPY --from=builder /app/scripts/ /app/scripts/

# Establecer permisos correctos
RUN chown -R appuser:appuser /app

# Cambiar a usuario no root
USER appuser

# Exponer puerto del servicio
EXPOSE 8080

# Configurar variables de entorno
ENV PORT=8080
ENV ENVIRONMENT=production

# Healthcheck para verificar que el servicio está funcionando
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Punto de entrada de la aplicación
ENTRYPOINT ["/app/notification-service"]