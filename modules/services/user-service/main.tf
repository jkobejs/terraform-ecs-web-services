resource "aws_ecr_repository" "ecr" {
  name                 = "${var.ecs_cluster_name}-ecr/user-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_cloudwatch_log_group" "user_service" {
  name              = "user-service"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "user_service" {
  family = "user-service"

  container_definitions = <<EOF
[
      {
        "name": "user-service",
        "image": "${aws_ecr_repository.ecr.repository_url}:1.0-SNAPSHOT",
        "memory": 512,
        "cpu": 128,
        "portMappings": [
          {
            "containerPort": 9000,
            "protocol": "tcp"
          }
        ],
        "environment" : [
            { "name" : "JDBC_DATABASE_URL", "value" : "jdbc:postgresql://${var.db_host}:5432/${var.db_name}" },
            { "name" : "DATABASE_USER", "value" : "${var.db_username}" },
            { "name" : "DATABASE_PASSWORD", "value" : "${var.db_password}" }
        ],
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
              "awslogs-region": "eu-central-1",
              "awslogs-group": "user-service",
              "awslogs-stream-prefix": "ecs-terraform-free-tier"
            }
          }
      }
]
EOF
}

resource "aws_ecs_service" "user_service" {
  name            = "user-service"
  cluster         = var.ecs_cluster_id
  task_definition = "${aws_ecs_task_definition.user_service.family}:${aws_ecs_task_definition.user_service.revision}"
  iam_role        = var.alb_ecs_role_arn
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = var.alb_traget_group_arn
    container_name   = "user-service"
    container_port   = 9000
  }

  desired_count = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0
}