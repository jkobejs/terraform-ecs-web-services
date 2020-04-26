
variable name {
  default = "ecs-terraform"
}

variable environment {
  default = "dev"
}

variable cluster_name {
  default = "ecs-terraform-dev"
}


variable vpc_id {
  type        = string
  description = "Id of VPC to place load balancer resources in"
}

variable subnet_ids {
  type        = list(string)
  description = "List of subnet ids to place the auto scaling grou in"
}

variable alb_security_group_id {
  type        = string
  description = "ID of ALB security group"
}


variable instance_type {
  type        = string
  description = "EC2 instance type"
}

variable min_size {
  type        = number
  description = "The minimum size of the auto scale group"
}

variable max_size {
  type        = number
  description = "The maximum size of the auto scale group"
}

variable desired_capacity {
  type        = number
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable wait_for_capacity_timeout {
  type        = number
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over min_elb_capacity behavior.	"
}