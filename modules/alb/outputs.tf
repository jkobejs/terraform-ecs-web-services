output "security_group_id" {
  value = "${aws_security_group.alb_sg.id}"
}

output "id" {
  value = "${module.alb.this_lb_id}"
}

output "arn" {
  value = "${module.alb.this_lb_arn}"
}

output "dns_name" {
  value = "${module.alb.this_lb_dns_name}"
}

output "default_traget_group_arn" {
  value = "${coalesce(flatten([module.alb.target_group_arns])...)}"
}

output "traget_group_arns" {
  value = "${module.alb.target_group_arns}"
}

output "name" {
  value = "${module.alb.this_lb_dns_name}"
}

output "ecs_role_arn" {
  value = "${aws_iam_role.ecs_lb_role.arn}"
}
