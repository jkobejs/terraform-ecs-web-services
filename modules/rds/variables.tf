
variable name {
  type        = string
  description = "Service name"
}

variable environment {
  type        = string
  description = "Database environment"
}

variable vpc_id {
  type = string

  description = "Id of VPC to place load balancer resources in"
}

variable subnet_ids {
  type        = list(string)
  description = "List of database subnet ids to place the database in"
}

variable container_instance_security_group_id {
  type        = string
  description = "Container instance security group id"
}

variable db_name {
  type        = string
  description = "Database name"
}

variable password {
  type        = string
  description = "Database password"
}

variable username {
  type        = string
  description = "Database username"
}

variable instance_type {
  type        = string
  description = "Database instance type"
}