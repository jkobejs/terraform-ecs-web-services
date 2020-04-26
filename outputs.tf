output "ecs_cluster_id" {
  value       = "${module.ecs.this_ecs_cluster_id}"
  description = "ECS cluster id"
}

output "ecs_cluster_arn" {
  value       = "${module.ecs.this_ecs_cluster_arn}"
  description = "ECS cluster arn"
}

output "ecs_cluster_name" {
  value       = "${module.ecs.this_ecs_cluster_name}"
  description = "ECS cluster name"
}

output "vpc_id" {
  value       = "${module.vpc.id}"
  description = "VPC id"
}

output "ecr_arn" {
  value       = "${module.user-service.ecr_arn}"
  description = "ECR arn"
}

output "ecr_id" {
  value       = "${module.user-service.ecr_id}"
  description = "ECR id"
}

output "erc_url" {
  value       = "${module.user-service.erc_url}"
  description = "ECR url"
}

output "alb_arn" {
  value       = "${module.alb.arn}"
  description = "ALB arn"
}
output "alb_traget_group_arns" {
  value       = "${module.alb.traget_group_arns}"
  description = "ALB target groups arns"
}

output "alb_dns_name" {
  value       = "${module.alb.dns_name}"
  description = "ALB DNS name"
}

output "alb_ecs_role_arn" {
  value       = "${module.alb.ecs_role_arn}"
  description = "ALB role"
}

output "asg_arn" {
  value       = "${module.asg.arn}"
  description = "ASG arn"
}

output "rds_arn" {
  value       = "${module.rds.arn}"
  description = "RDS arn"
}

output "rds_host" {
  value       = "${module.rds.host}"
  description = "RDS host"
}
