#!/bin/bash

# ==============================================================================
# Script de verificación de estado de recursos desplegados con Terraform
# Este script valida que la infraestructura aprovisionada esté operativa
# ==============================================================================

set -euo pipefail

# Configuración de colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables de entorno con valores por defecto
AWS_REGION="${AWS_REGION:-us-east-1}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
STACK_NAME="notificaciones-${ENVIRONMENT}"
MAX_RETRIES=3
RETRY_DELAY=5

# Función para imprimir mensajes con timestamp
log() {
    local level=$1
    shift
    local message="$*"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${timestamp} [${level}] ${message}"
}

# Función para mensajes de éxito
success() {
    log "${GREEN}✓${NC}" "$*"
}

# Función para mensajes de advertencia
warn() {
    log "${YELLOW}⚠${NC}" "$*"
}

# Función para mensajes de error
error() {
    log "${RED}✗${NC}" "$*"
}

# Función para verificar disponibilidad de AWS CLI
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        error "AWS CLI no está instalado o no está en el PATH"
        return 1
    fi

    if ! aws sts get-caller-identity &> /dev/null; then
        error "No hay credenciales de AWS válidas configuradas"
        return 1
    fi

    success "AWS CLI configurado correctamente"
    return 0
}

# Función para obtener el ID de la VPC desde los outputs de Terraform
get_vpc_id() {
    local vpc_name="${STACK_NAME}-vpc"
    local vpc_id
    
    vpc_id=$(aws ec2 describe-vpcs \
        --filters "Name=tag:Name,Values=${vpc_name}" \
        --query 'Vpcs[0].VpcId' \
        --output text 2>/dev/null || echo "")
    
    if [[ -z "$vpc_id" || "$vpc_id" == "None" ]]; then
        error "No se encontró la VPC: ${vpc_name}"
        return 1
    fi
    
    echo "$vpc_id"
}

# Función para verificar el estado de la VPC
check_vpc() {
    local vpc_id=$1
    local vpc_state
    
    log "Verificando estado de la VPC..."
    
    vpc_state=$(aws ec2 describe-vpcs \
        --vpc-ids "$vpc_id" \
        --query 'Vpcs[0].State' \
        --output text 2>/dev/null)
    
    if [[ "$vpc_state" == "available" ]]; then
        success "VPC ${vpc_id} está disponible"
        return 0
    else
        error "VPC ${vpc_id} en estado: ${vpc_state}"
        return 1
    fi
}

# Función para verificar las subnets asociadas a la VPC
check_subnets() {
    local vpc_id=$1
    local subnet_count
    
    log "Verificando subnets de la VPC..."
    
    subnet_count=$(aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(Subnets)' \
        --output text 2>/dev/null)
    
    if [[ "$subnet_count" -gt 0 ]]; then
        success "Se encontraron ${subnet_count} subnets"
        
        # Verificar que todas las subnets estén disponibles
        local unavailable_subnets
        unavailable_subnets=$(aws ec2 describe-subnets \
            --filters "Name=vpc-id,Values=${vpc_id}" "Name=state,Values=pending" \
            --query 'length(Subnets)' \
            --output text 2>/dev/null)
        
        if [[ "$unavailable_subnets" -eq 0 || "$unavailable_subnets" == "None" ]]; then
            success "Todas las subnets están disponibles"
            return 0
        else
            warn "${unavailable_subnets} subnets aún están en estado pending"
            return 1
        fi
    else
        error "No se encontraron subnets para la VPC ${vpc_id}"
        return 1
    fi
}

# Función para verificar los Security Groups
check_security_groups() {
    local vpc_id=$1
    
    log "Verificando Security Groups..."
    
    local sg_count
    sg_count=$(aws ec2 describe-security-groups \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(SecurityGroups)' \
        --output text 2>/dev/null)
    
    if [[ "$sg_count" -gt 0 ]]; then
        success "Se encontraron ${sg_count} Security Groups"
        return 0
    else
        error "No se encontraron Security Groups para la VPC ${vpc_id}"
        return 1
    fi
}

# Función para verificar instancias EC2
check_ec2_instances() {
    local instance_count
    
    log "Verificando instancias EC2..."
    
    # Buscar instancias por tag Name
    instance_count=$(aws ec2 describe-instances \
        --filters "Name=tag:Environment,Values=${ENVIRONMENT}" \
                "Name=tag:Service,Values=notificaciones" \
                "Name=instance-state-name,Values=running" \
        --query 'length(Reservations[].Instances[])' \
        --output text 2>/dev/null)
    
    if [[ "$instance_count" -gt 0 ]]; then
        success "Se encontraron ${instance_count} instancias EC2 en ejecución"
        return 0
    else
        warn "No se encontraron instancias EC2 en ejecución para el servicio de notificaciones"
        return 0
    fi
}

# Función para verificar tablas de enrutamiento
check_route_tables() {
    local vpc_id=$1
    
    log "Verificando tablas de enrutamiento..."
    
    local rt_count
    rt_count=$(aws ec2 describe-route-tables \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(RouteTables)' \
        --output text 2>/dev/null)
    
    if [[ "$rt_count" -gt 0 ]]; then
        success "Se encontraron ${rt_count} tablas de enrutamiento"
        return 0
    else
        error "No se encontraron tablas de enrutamiento para la VPC ${vpc_id}"
        return 1
    fi
}

# Función para verificar conectividad a endpoints
check_endpoints() {
    local vpc_id=$1
    
    log "Verificando endpoints de VPC..."
    
    local endpoint_count
    endpoint_count=$(aws ec2 describe-vpc-endpoints \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(VpcEndpoints)' \
        --output text 2>/dev/null)
    
    if [[ "$endpoint_count" -gt 0 ]]; then
        success "Se encontraron ${endpoint_count} endpoints de VPC"
        return 0
    else
        warn "No se encontraron endpoints de VPC (puede ser normal si no se configuraron)"
        return 0
    fi
}

# Función principal que orquesta todas las verificaciones
main() {
    local exit_code=0
    local vpc_id
    
    echo "=========================================="
    echo "  Healthcheck de Infraestructura"
    echo "  Entorno: ${ENVIRONMENT}"
    echo "  Región: ${AWS_REGION}"
    echo "=========================================="
    echo ""
    
    # Verificar que AWS CLI esté disponible
    if ! check_aws_cli; then
        error "Fallo en verificación de AWS CLI"
        exit 1
    fi
    
    # Obtener ID de la VPC
    vpc_id=$(get_vpc_id) || {
        error "No se pudo obtener el ID de la VPC"
        exit 1
    }
    
    success "VPC ID: ${vpc_id}"
    echo ""
    
    # Ejecutar verificaciones
    check_vpc "$vpc_id" || exit_code=1
    check_subnets "$vpc_id" || exit_code=1
    check_security_groups "$vpc_id" || exit_code=1
    check_route_tables "$vpc_id" || exit_code=1
    check_endpoints "$vpc_id"
    check_ec2_instances
    
    echo ""
    echo "=========================================="
    
    if [[ $exit_code -eq 0 ]]; then
        success "Healthcheck completado: Todos los recursos están operativos"
        echo "=========================================="
        exit 0
    else
        error "Healthcheck completado con errores"
        echo "=========================================="
        exit 1
    fi
}

# Ejecutar función principal
main "$@"