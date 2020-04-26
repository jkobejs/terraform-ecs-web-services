module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  name = var.name

  cidr                   = var.cidr
  azs                    = var.azs
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  database_subnets       = var.database_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  single_nat_gateway     = false

  tags = {
    Environment = var.environment
    Name        = var.name
  }
}