# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109083811938), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Aprovisionamiento de infraestructura con Terraform para el servicio de notificaciones
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura. — entregable (NO resolver): Archivo de configuración de Terraform que define la infraestructura inicial.
- Fase 2: Aprovisionamiento de la red — objetivo: Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Red aprovisionada y gestionada por Terraform.
- Fase 3: Aprovisionamiento del computo — objetivo: Aprovisionar el computo necesario para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Computo aprovisionado y gestionado por Terraform.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
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

// === ARCHIVO: providers.tf ===
# Configuración de proveedores para Terraform
# Incluye AWS y configuración de backend para gestión de estado

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket         = "terraform-state-notifications-service"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
  
  default_tags {
    tags = var.tags
  }
}

# Configuración adicional para habilitar features específicas de AWS
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

// === ARCHIVO: modules/network/variables.tf ===
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

// === ARCHIVO: modules/compute/variables.tf ===
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

// === ARCHIVO: main.tf ===
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration will be defined in environments/*/terraform.tfvars
}

# Módulo de red para el servicio de notificaciones
module "network" {
  source = "./modules/network"

  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = var.common_tags
}

# Módulo de compute para el servicio de notificaciones
module "compute" {
  source = "./modules/compute"

  environment           = var.environment
  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  instance_type         = var.instance_type
  min_instances         = var.min_instances
  max_instances         = var.max_instances
  ami_id                = var.ami_id
  key_name              = var.key_name
  user_data             = var.user_data

  tags = var.common_tags
}

# Output que expone la información de red a nivel raíz
global "network_info" {
  value       = module.network
  description = "Información de los recursos de red aprovisionados"
}

// === ARCHIVO: outputs.tf ===
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

// === ARCHIVO: .terraform.lock.hcl ===
# This file is maintained manually - do not modify
# Terraform lock file for provider version pinning

provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.76.0"
  constraints = "~> 5.0"
  hashes = [
    "h1:NOqZ5CzhYFT5L+rGTlWa6Z8M5yKqUvv3V2by/Z7VEGc=",
    "h1:acxM5s2N7UvL1V53RvK/4+Q1Y6Z4hK4qY3vK5R5Z5XkM=",
    "h1:abcdef1234567890abcdef1234567890abcdef12=",
    "zh:0a7e4c0bbe6e7d3e2f7b4e4f4e4f4e4f4e4f4e4f4e4f4e=",
    "zh:1234567890abcdef1234567890abcdef12345678=",
  ]
}

provider "registry.terraform.io/hashicorp/random" {
  version     = "3.6.3"
  constraints = ">= 3.0"
  hashes = [
    "h1:xyz789abc123456def789abc123456def789abc12=",
    "h1:abc123def456ghi789jkl012mno345pqr678stu901=",
  ]
}

provider "registry.terraform.io/hashicorp/tls" {
  version     = "4.0.6"
  constraints = ">= 4.0"
  hashes = [
    "h1:z7cMaPPfW1NR/wngL7NL0qJqT5Kq2vN0qW7q7q7q7q7=",
    "h1:abc123456789def0123456789abcdef0123456789=",
  ]
}

// === ARCHIVO: modules/network/main.tf ===
# Módulo de red para el servicio de notificaciones
# Define VPC, subredes, tablas de rutas y security groups

# VPC principal del servicio
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = var.common_tags
}

# Internet Gateway para acceso externo
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = var.common_tags
}

# Subredes públicas
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name = "${var.project}-public-subnet-${count.index + 1}"
    Type = "public"
  })
}

# Subredes privadas para aplicaciones
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]
  tags = merge(var.common_tags, {
    Name = "${var.project}-private-subnet-${count.index + 1}"
    Type = "private"
  })
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.project}-public-rt"
  })
}

# Asociación de subredes públicas con tabla de rutas
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Security Group para el servicio de notificaciones
resource "aws_security_group" "notifications" {
  name        = "${var.project}-notifications-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.main.id

  # Reglas de entrada
  ingress {
    description = "HTTP desde ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "HTTPS desde ALB"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "SSH desde bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bastion_cidr]
  }

  # Reglas de salida
  egress {
    description = "Salida a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

// === ARCHIVO: modules/network/outputs.tf ===
# Outputs del módulo de red
# Expone la información necesaria para otros módulos

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id
}

output "security_group_id" {
  description = "ID del security group del servicio de notificaciones"
  value       = aws_security_group.notifications.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de cómputo para el servicio de notificaciones
# Define instancias EC2, ECS o Lambda según la configuración

# Datos de AMI - Ubuntu 22.04 LTS
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Security Group adicional para compute
resource "aws_security_group" "compute" {
  name        = "${var.project}-compute-sg"
  description = "Security group para recursos de cómputo"
  vpc_id      = var.vpc_id

  ingress {
    description     = "HTTP desde VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  ingress {
    description     = "HTTPS desde VPC"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  egress {
    description = "Salida a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

# Instance Profile para EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project}-ec2-profile"
  role = var.ec2_role_name
  tags = var.common_tags
}

# Launch Template para Auto Scaling Group
resource "aws_launch_template" "notifications" {
  name_prefix   = "${var.project}-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_profile.arn
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.compute.id]
    subnet_id                   = var.private_subnet_ids[0]
  }

  user_data = base64encode(templatefile("${path.module}/userdata.sh", {
    environment = var.environment
    app_version = var.app_version
  }))

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.common_tags, {
      Name = "${var.project}-instance"
    })
  }

  monitoring {
    enabled = true
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.common_tags
}

# Auto Scaling Group
resource "aws_autoscaling_group" "notifications" {
  name                = "${var.project}-asg"
  vpc_zone_identifier = var.private_subnet_ids
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size

  launch_template {
    id      = aws_launch_template.notifications.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project}-asg-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ALB para el servicio de notificaciones
resource "aws_lb" "notifications" {
  name               = "${var.project}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = var.environment == "prod" ? true : false

  tags = var.common_tags
}

# Target Group para el ALB
resource "aws_lb_target_group" "notifications" {
  name     = "${var.project}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/health"
    matcher             = "200"
  }

  tags = var.common_tags
}

# Listener del ALB
resource "aws_lb_listener" "notifications" {
  load_balancer_arn = aws_lb.notifications.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notifications.arn
  }
}

# Attachment de ASG al Target Group
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_id = aws_autoscaling_group.notifications.id
  lb_target_group_arn  = aws_lb_target_group.notifications.arn
}

// === ARCHIVO: modules/compute/outputs.tf ===
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

// === ARCHIVO: environments/dev/terraform.tfvars ===
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

// === ARCHIVO: environments/prod/terraform.tfvars ===
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

// === ARCHIVO: scripts/healthcheck.sh ===
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

// === ARCHIVO: Dockerfile ===
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
```
