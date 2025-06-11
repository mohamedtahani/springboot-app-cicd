module "vpc" {
  source = "../../modules/vpc"
  vpc_name = var.vpc_name
  cidr_block = var.vpc_cidr	
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones = var.availability_zones
}