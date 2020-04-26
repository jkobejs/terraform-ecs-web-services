output "container_instance_security_group_id" {
  value = "${aws_security_group.ci_sg.id}"
}

output "arn" {
  value = "${module.asg.this_autoscaling_group_arn}"
}
