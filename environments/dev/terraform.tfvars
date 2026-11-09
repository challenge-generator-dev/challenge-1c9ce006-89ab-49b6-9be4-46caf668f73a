# Valores de variables para el ambiente de desarrollo
# Servicio de Notificaciones - Configuración de infraestructura

# Configuración regionalegion = "us-east-1"

# Red
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

# Etiquetas comunesenvironment        = "dev"
project_name        = "notification-service"
cost_center         = "engineering"
owner_team          = "platform"

# Configuración de cómputo
example_instance_type = "t3.micro"
instance_count        = 1
enable_autoscaling    = false
min_instances         = 1
max_instances         = 2

# Configuración de almacenamiento
example_volume_size = 20
volume_type        = "gp3"

# Configuración de red avanzada
enable_nat_gateway     = true
enable_vpn_gateway     = false
enable_dns_hostnames   = true
enable_dns_support     = true

# Configuración de seguridad
enable_flow_logs           = false
log_retention_days         = 7
enable_deletion_protection = false

# Configuración de monitoreo
example_enable_monitoring = true
enable_cloudwatch_agent = false
log_level              = "debug"

# Configuración de auto-scaling (deshabilitado en dev)
asg_desired_capacity = 1
asg_min_size          = 1
asg_max_size          = 2
asg_cpu_target        = 70
asg_memory_target     = 80