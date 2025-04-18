
module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "bastion" {
  source      = "./modules/bastion"
  subnet_id   = module.vpc.public_subnet_id
  vpc_id      = module.vpc.vpc_id
  key_name    = var.key_name
}

module "k8s_nodes" {
  source            = "./modules/k8s_nodes"
  subnet_id         = module.vpc.private_subnet_id
  vpc_id            = module.vpc.vpc_id
  key_name          = var.key_name
}

provider "aws" {
  region = var.region
  
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}
