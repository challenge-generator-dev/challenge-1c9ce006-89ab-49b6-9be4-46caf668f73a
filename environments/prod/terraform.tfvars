# Valores de variables para el ambiente de producción
# Servicio de Notificaciones - Configuración de infraestructura

# Configuración regionalegion = "us-east-1"

# Red
vpc_cidr             = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24", "10.1.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Etiquetas comunesenvironment        = "prod"
project_name        = "notification-service"
cost_center         = "engineering"
owner_team          = "platform"

# Configuración de cómputo
example_instance_type = "t3.medium"
instance_count        = 3
enable_autoscaling    = true
min_instances         = 2
max_instances         = 10

# Configuración de almacenamiento
example_volume_size = 50
volume_type        = "gp3"

# Configuración de red avanzada
enable_nat_gateway     = true
enable_vpn_gateway     = true
enable_dns_hostnames   = true
enable_dns_support     = true

# Configuración de seguridad
enable_flow_logs           = true
log_retention_days         = 90
enable_deletion_protection = true

# Configuración de monitoreo
example_enable_monitoring = true
enable_cloudwatch_agent = true
log_level              = "info"

# Configuración de auto-scaling (habilitado en prod con valores de producción)
asg_desired_capacity = 3
asg_min_size          = 2
asg_max_size          = 10
asg_cpu_target        = 60
asg_memory_target     = 75

# Configuración de alta disponibilidad y recuperación
enable_cross_zone_load_balancing = true
enable_connection_draining     = true
connection_draining_timeout    = 300

# Configuración de respaldoenable_backup          = true
backup_retention_days = 30
backup_schedule      = "cron(0 5 ? * * *)"