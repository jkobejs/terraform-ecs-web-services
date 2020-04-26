provider "aws" {
  profile = var.profile
  region  = var.region
}

locals {
  name        = var.name
  environment = var.environment

  # This is the convention we use to know what belongs to each other
  resource_name = "${local.name}-${local.environment}"
}

# -------------------- ECS -------------------- 
module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 2.0"

  name = local.resource_name
}

# -------------------- VPC -------------------- 
module "vpc" {
  source                 = "./modules/vpc"
  name                   = "${local.resource_name}-vpc"
  environment            = local.name
  azs                    = var.azs
  cidr                   = var.cidr
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  database_subnets       = var.database_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
}

# -------------------- ALB -------------------- 
module "alb" {
  source            = "./modules/alb"
  name              = "${local.resource_name}-alb"
  environment       = local.environment
  vpc_id            = module.vpc.id
  public_subnet_ids = module.vpc.public_subnet_ids
}

# -------------------- ASG -------------------- 
module "asg" {
  source                    = "./modules/asg"
  name                      = "${local.resource_name}-asg"
  cluster_name              = local.resource_name
  environment               = local.environment
  vpc_id                    = module.vpc.id
  subnet_ids                = var.public_container_instances ? module.vpc.public_subnet_ids : module.vpc.private_subnet_ids
  alb_security_group_id     = module.alb.security_group_id
  instance_type             = var.ec2_instance_type
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  wait_for_capacity_timeout = var.asg_wait_for_capacity_timeout
}

# -------------------- RDS -------------------- 
module "rds" {
  source                               = "./modules/rds"
  name                                 = "${local.resource_name}-rds"
  environment                          = "${local.environment}"
  vpc_id                               = module.vpc.id
  subnet_ids                           = module.vpc.database_subnet_ids
  container_instance_security_group_id = module.asg.container_instance_security_group_id
  db_name                              = var.db_name
  username                             = var.db_username
  password                             = var.db_password
  instance_type                        = var.db_instance_type
}

# -------------------- SERVICES -------------------- 
module "user-service" {
  source               = "./modules/services/user-service"
  ecs_cluster_name     = local.resource_name
  ecs_cluster_id       = module.ecs.this_ecs_cluster_id
  alb_traget_group_arn = module.alb.default_traget_group_arn
  alb_ecs_role_arn     = module.alb.ecs_role_arn
  db_host              = module.rds.host
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
}
