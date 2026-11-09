# Aprovisionamiento de infraestructura con Terraform para el servicio de notificaciones

El objetivo es aprovisionar la infraestructura necesaria para el servicio de notificaciones utilizando Terraform. El sistema debe incluir la red y el computo. Los recursos deben ser versionados y gestionados de manera eficiente.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Go 1.21+, VS Code o GoLand.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `go build ./...`. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos necesarios para la red y el computo del servicio de notificaciones.
- Configurar el archivo principal de Terraform para definir la infraestructura.

**Entregable:** Archivo de configuración de Terraform que define la infraestructura inicial.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza el lenguaje declarativo de Terraform para definir la infraestructura.
- Asegúrate de que la configuración sea idempotente.

</details>

### Fase 2: Aprovisionamiento de la red

**Objetivo:** Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los recursos de red (VPC, subredes, rutas) en el archivo de Terraform.
- Aplicar la configuración para crear la red.

**Entregable:** Red aprovisionada y gestionada por Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza módulos de Terraform para reutilizar configuraciones comunes.
- Asegura que la red cumpla con los requisitos de seguridad y rendimiento.

</details>

### Fase 3: Aprovisionamiento del computo

**Objetivo:** Aprovisionar el computo necesario para el servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los recursos de computo (instancias, contenedores) en el archivo de Terraform.
- Aplicar la configuración para crear el computo.

**Entregable:** Computo aprovisionado y gestionado por Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza proveedores de Terraform para interactuar con diferentes plataformas de cloud.
- Asegura que el computo cumpla con los requisitos de escalabilidad y rendimiento.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para aprovisionar infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura del servicio de notificaciones?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para definir y aplicar la configuración de la red y el computo?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el aprovisionamiento de la infraestructura para el servicio de notificaciones?

## Criterios de Evaluacion

- Configuración inicial de Terraform correctamente definida.
- Red aprovisionada y gestionada por Terraform.
- Computo aprovisionado y gestionado por Terraform.
- Infraestructura versionada y gestionada de manera eficiente.
- Decisiones informadas y justificadas en el aprovisionamiento de la infraestructura.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
