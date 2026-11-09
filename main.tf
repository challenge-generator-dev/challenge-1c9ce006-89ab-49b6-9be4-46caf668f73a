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