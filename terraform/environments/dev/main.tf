terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_name = var.vpc_name
  cidr_block = var.vpc_cidr	
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones = var.availability_zones
}