# Variables específicas para el módulo de red

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de CIDRs para subredes públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de CIDRs para subredes privadas"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos de red"
  type        = map(string)
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway para subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar un único NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}