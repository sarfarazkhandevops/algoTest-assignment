module "vpc" {
  source = "./modules/vpc"

  vpc_name            = local.name
  vpc_cidr            = var.vpc_cidr
  azs                 = var.availability_zones
  public_subnet_cidr  = var.public_subnets
  private_subnet_cidr = var.private_subnets
  tags                = var.tags
}