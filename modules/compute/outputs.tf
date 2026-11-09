output "instance_ids" {
  description = "IDs de las instancias de cómputo aprovisionadas"
  value       = aws_instance.notification_service[*].id
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias de cómputo"
  value       = aws_instance.notification_service[*].private_ip
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias de cómputo"
  value       = aws_instance.notification_service[*].public_ip
}

output "security_group_id" {
  description = "ID del grupo de seguridad asociado a las instancias"
  value       = aws_security_group.compute_sg.id
}

output "iam_instance_profile" {
  description = "Nombre del perfil de IAM asociado a las instancias"
  value       = aws_iam_instance_profile.notification_service.name
}

output "launch_template_id" {
  description = "ID de la plantilla de lanzamiento (si se usa ASG)"
  value       = try(aws_launch_template.notification_service[0].id, null)
}

output "autoscaling_group_name" {
  description = "Nombre del grupo de auto-scaling (si está configurado)"
  value       = try(aws_autoscaling_group.notification_service[0].name, null)
}

output "arn" {
  description = "ARN del recurso de cómputo principal"
  value       = aws_instance.notification_service[0].arn
}