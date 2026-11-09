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