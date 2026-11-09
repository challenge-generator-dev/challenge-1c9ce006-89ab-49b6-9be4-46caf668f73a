# Variables globales para la configuración de Terraform
# Estas variables se utilizan en los módulos de red y cómputo

variable "region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Lista de CIDRs para subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Lista de CIDRs para subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 en us-east-1
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
  default     = 2
}

variable "tags" {
  description = "Etiquetas para los recursos"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}