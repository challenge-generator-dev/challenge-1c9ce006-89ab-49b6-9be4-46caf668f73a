# Variables específicas para el módulo de cómputo

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de security groups para las instancias"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes para el Auto Scaling Group"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "tags" {
  description = "Etiquetas para los recursos de cómputo"
  type        = map(string)
}

variable "user_data" {
  description = "Script de user data para las instancias EC2"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
  default     = "notifications-service-key"
}

variable "health_check_type" {
  description = "Tipo de health check para el Auto Scaling Group"
  type        = string
  default     = "EC2"
}