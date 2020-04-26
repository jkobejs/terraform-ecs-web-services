
variable name {
  type = string
}

variable environment {
  type = string
}

variable vpc_id {
  type        = string
  description = "Id of VPC to place load balancer resources in"
}

variable public_subnet_ids {
  type        = list(string)
  description = "List of public subnet ids to place the loadbalancer in"
}