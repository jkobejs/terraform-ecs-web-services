output "id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = "${module.vpc.private_subnets}"
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = "${module.vpc.public_subnets}"
}

output "database_subnet_ids" {
  description = "List of IDs of database subnets"
  value       = "${module.vpc.database_subnets}"
}