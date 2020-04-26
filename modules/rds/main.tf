
resource "aws_security_group" "database_sg" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "TCP"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.container_instance_security_group_id]
  }

  ingress {
    description = "TCP"
    from_port   = 1
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Name        = var.name
  }
}


module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "${var.name}-pg"

  engine            = "postgres"
  engine_version    = "11.5"
  instance_class    = var.instance_type
  allocated_storage = 20
  storage_encrypted = false

  name = var.db_name

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  username = var.username

  password = var.password
  port     = "5432"

  vpc_security_group_ids = [aws_security_group.database_sg.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Owner       = var.name
    Environment = var.environment
  }

  # DB subnet group
  subnet_ids                = var.subnet_ids
  family                    = "postgres11"
  major_engine_version      = "11"
  final_snapshot_identifier = var.db_name
  deletion_protection       = false
}
