resource "aws_security_group" "ci_sg" {
  name   = "${var.name}-ci-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "HTTP"
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
    self            = true
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


data "template_file" "user_data" {
  template = file("${path.module}/templates/user-data.sh")

  vars = {
    cluster_name = var.cluster_name
  }
}

module "ec2-profile" {
  source  = "terraform-aws-modules/ecs/aws//modules/ecs-instance-profile"
  version = "~> 2.0"

  name = var.name
}

data "aws_ami" "amazon_linux_ecs" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}


module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"

  name = "${var.name}-ec2"

  # Launch configuration
  lc_name = "${var.name}-lc"

  image_id                    = "ami-0e9347664c1c5ed65"
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.ci_sg.id]
  iam_instance_profile        = module.ec2-profile.this_iam_instance_profile_id
  user_data                   = data.template_file.user_data.rendered
  associate_public_ip_address = false


  # Auto scaling group
  asg_name                  = var.name
  vpc_zone_identifier       = var.subnet_ids
  health_check_type         = "EC2"
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  wait_for_capacity_timeout = var.wait_for_capacity_timeout

  tags = [
    {
      key                 = "Environment"
      value               = var.environment
      propagate_at_launch = true
    },
    {
      key                 = "Cluster"
      value               = var.cluster_name
      propagate_at_launch = true
    },
  ]
}
