# Outputs de la infraestructura del servicio de notificaciones

output "vpc_id" {
  description = "ID de la VPC principal"
  value       = module.network.vpc_id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas donde se ejecutarán los servicios"
  value       = module.network.private_subnet_ids
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas para recursos de acceso público"
  value       = module.network.public_subnet_ids
}

output "security_group_id" {
  description = "ID del security group para el servicio de notificaciones"
  value       = module.compute.security_group_id
}

output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = module.compute.instance_ids
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

output "load_balancer_dns_name" {
  description = "Nombre DNS del Application Load Balancer"
  value       = module.compute.load_balancer_dns_name
}

output "service_endpoint" {
  description = "Endpoint público del servicio de notificaciones"
  value       = "http://${module.compute.load_balancer_dns_name}"
}