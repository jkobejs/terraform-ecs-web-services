
variable name {
  description = "Base name for all resources"
  default     = "ecs-terraform"
}

variable environment {
  description = "Environment in which resources will be created"
  default     = "dev"
}

variable region {
  description = "AWS region"
  default     = "eu-central-1"
}

variable profile {
  description = "Named profile, more on https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html"
  default     = "default"
}

variable azs {
  description = "Availability zones, at least 2 availability zones should be specified"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable cidr {
  description = "VPC's cidr"
  default     = "10.1.0.0/16"
}

variable public_subnets {
  description = "Subnet in which public services will be deployed"
  default     = ["10.1.11.0/24", "10.1.21.0/24"]
}

variable private_subnets {
  description = "Subnet in which private services will be deployed"
  default     = ["10.1.12.0/24", "10.1.22.0/24"]
}

variable database_subnets {
  description = "Subnet in which database services will be deployed"
  default     = ["10.1.13.0/24", "10.1.23.0/24"]
}

variable enable_nat_gateway {
  description = "Flag that determines if NAT gateway will be created"
  default     = true
}

variable one_nat_gateway_per_az {
  description = "Flag that determines if one NAT gateway will be created per AZ"
  default     = true
}

variable ec2_instance_type {
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable public_container_instances {
  default     = false
  description = "Flag that determines if container instances are in public subnet (useful in free tier)"
}

variable asg_min_size {
  default     = 0
  description = "The minimum size of the auto scale group"
}

variable asg_max_size {
  default     = 1
  description = "The maximum size of the auto scale group"
}

variable asg_desired_capacity {
  default     = 0
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable asg_wait_for_capacity_timeout {
  default     = 0
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over min_elb_capacity behavior.	"
}

variable db_instance_type {
  default     = "db.t2.micro"
  description = "Database instance type"
}

variable db_name {
  default     = "master"
  description = "Database name"
}

variable db_username {
  default     = "db_user"
  description = "Database username"
}

variable db_password {
  default     = "ChangeMe!"
  description = "Database password"
}

