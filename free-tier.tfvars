region  = "eu-central-1"
profile = "default"

name        = "ecs-terraform"
environment = "free-tier"

azs                    = ["eu-central-1a", "eu-central-1b"]
cidr                   = "10.1.0.0/16"
public_subnets         = ["10.1.11.0/24", "10.1.21.0/24"]
private_subnets        = ["10.1.12.0/24", "10.1.22.0/24"]
database_subnets       = ["10.1.13.0/24", "10.1.23.0/24"]
enable_nat_gateway     = false
one_nat_gateway_per_az = false

ec2_instance_type             = "t2.micro"
public_container_instances    = true
asg_min_size                  = 0
asg_max_size                  = 1
asg_desired_capacity          = 1
asg_wait_for_capacity_timeout = 0

db_instance_type = "db.t2.micro"
db_name          = "master"
db_username      = "postgres"
db_password      = "postgres"