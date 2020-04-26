variable "ecs_cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "ecs_cluster_id" {
  type        = string
  description = "Id of cluster to run service in"
}

variable "alb_traget_group_arn" {
  type        = string
  description = "Traget group arns in which place service"
}

variable "alb_ecs_role_arn" {
  type        = string
  description = "Role arn to place task in traget groups"
}

variable "db_host" {
  type        = string
  description = "RDS host to connect service to"
}

variable "db_name" {
  type        = string
  description = "RDS database to connect service to"
}

variable "db_username" {
  type        = string
  description = "RDS username "
}

variable "db_password" {
  type        = string
  description = "RDS password"
}