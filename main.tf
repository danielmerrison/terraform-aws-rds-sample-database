terraform {
  required_version = "~> 1"
  required_providers {
    aws = {
      version = "~> 3"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

module "example_internal_module" {
  source = "./modules/internal-module"
  name   = var.name
}

module "example_external_module" {
  source = "./modules/external-module"
  name   = var.name
}

locals {
  response = "main.tf: ${var.name}"
}
