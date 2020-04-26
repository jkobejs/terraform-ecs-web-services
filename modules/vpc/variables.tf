
variable name {
  type = string
}

variable environment {
  type = string
}

variable azs {
  type = list(string)
}

variable cidr {
  type = string
}

variable public_subnets {
  type = list(string)
}

variable private_subnets {
  type = list(string)
}

variable database_subnets {
  type = list(string)
}

variable enable_nat_gateway {
  type = bool
}

variable one_nat_gateway_per_az {
  type = bool
}
