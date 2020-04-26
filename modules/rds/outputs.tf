output "arn" {
  value = "${module.rds.this_db_instance_arn}"
}

output "host" {
  value = "${module.rds.this_db_instance_address}"
}