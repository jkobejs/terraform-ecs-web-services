# AWS Elastic Container Service (ECS) Terraform configuration 

Terraform configuration which creates EC2 lauch type ECS resources on AWS together with
postgres RDS.

[![asciicast](https://asciinema.org/a/uoauKuIhBbITN5gj66BdRaARj.svg)](https://asciinema.org/a/uoauKuIhBbITN5gj66BdRaARj?speed=6)

## Usage

You will first need to install [terraform](https://www.terraform.io/) and configure aws cli
[profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html).

```bash
brew install terraform
```

By default both, free tier and default configuration use `default` profile. If you want
to specify different profile you can to that by specifiying variables on the commandline
using `-var` option

```bash
terraform apply -var-file="free-tier.tfvars" -var="profile=jkobejs"
```

```bash
terraform apply -var="profile=jkobejs"
```

### Free tier

This configuration creates working ECS cluster with RDS using AWS Free
Tier offering.

To create free tier infrastructure run

```bash
terraform apply -var-file="free-tier.tfvars"
```

command. It will create virtual private network in **eu-central-1** region that contains:

- 2 availability zones
- 2 subnets (public, database)
- application load balancer (public subnet)
- auto scaling group (public subnet)
- RDS (database subnet)

![free-tier-vpc](images/ECS%20free%20tier%20VPC.png "Free Tier VPC")

Besides VPC command will create:

- ECS cluster
- container instances
- user ecs task and servic

Using this command auto scaling group that contains EC2 container intances will be
placed in public subnet. Usually desired place to place container instances would be
private subnet. Since container instances need to communicate with ECS cluster over
internet only way to satify this using Free Tier resources is to put it in public subnet
because NAT gateways are not part of Free Tier.

### Default (you will be billed for some resources)

By default terraform

```bash
terraform apply
```

command will create virtual private network in **eu-central-1** region that contains:

- 2 availability zones
- 3 subnets (public, private, database)
- application load balancer (public subnet)
- NAT gateway per availability zone (public subnet)
- auto scaling group (private subnet)
- RDS (database subnet)

![default-vpc](images/ECS%20default%20VPC.png "Default VPC")

Besides VPC command will create:

- ECS cluster
- container instances
- user ecs task and service

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| asg\_desired\_capacity | The number of Amazon EC2 instances that should be running in the group | `number` | `0` | no |
| asg\_max\_size | The maximum size of the auto scale group | `number` | `1` | no |
| asg\_min\_size | The minimum size of the auto scale group | `number` | `0` | no |
| asg\_wait\_for\_capacity\_timeout | Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over min\_elb\_capacity behavior. | `number` | `0` | no |
| azs | Availability zones, at least 2 availability zones should be specified | `list` | <pre>[<br>  "eu-central-1a",<br>  "eu-central-1b"<br>]</pre> | no |
| cidr | VPC's cidr | `string` | `"10.1.0.0/16"` | no |
| database\_subnets | Subnet in which database services will be deployed | `list` | <pre>[<br>  "10.1.13.0/24",<br>  "10.1.23.0/24"<br>]</pre> | no |
| db\_instance\_type | Database instance type | `string` | `"db.t2.micro"` | no |
| db\_name | Database name | `string` | `"master"` | no |
| db\_password | Database password | `string` | `"ChangeMe!"` | no |
| db\_username | Database username | `string` | `"db_user"` | no |
| ec2\_instance\_type | EC2 instance type | `string` | `"t2.micro"` | no |
| enable\_nat\_gateway | Flag that determines if NAT gateway will be created | `bool` | `true` | no |
| environment | Environment in which resources will be created | `string` | `"dev"` | no |
| name | Base name for all resources | `string` | `"ecs-terraform"` | no |
| one\_nat\_gateway\_per\_az | Flag that determines if one NAT gateway will be created per AZ | `bool` | `true` | no |
| private\_subnets | Subnet in which private services will be deployed | `list` | <pre>[<br>  "10.1.12.0/24",<br>  "10.1.22.0/24"<br>]</pre> | no |
| profile | Named profile, more on https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html | `string` | `"default"` | no |
| public\_container\_instances | Flag that determines if container instances are in public subnet (useful in free tier) | `bool` | `false` | no |
| public\_subnets | Subnet in which public services will be deployed | `list` | <pre>[<br>  "10.1.11.0/24",<br>  "10.1.21.0/24"<br>]</pre> | no |
| region | AWS region | `string` | `"eu-central-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| alb\_arn | ALB arn |
| alb\_dns\_name | ALB DNS name |
| alb\_ecs\_role\_arn | ALB role |
| alb\_traget\_group\_arns | ALB target groups arns |
| asg\_arn | ASG arn |
| ecr\_arn | ECR arn |
| ecr\_id | ECR id |
| ecs\_cluster\_arn | ECS cluster arn |
| ecs\_cluster\_id | ECS cluster id |
| ecs\_cluster\_name | ECS cluster name |
| erc\_url | ECR url |
| rds\_arn | RDS arn |
| rds\_host | RDS host |
| vpc\_id | VPC id |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [jkobejs](https://github.com/jkobejs)

## License

Apache 2 Licensed. See LICENSE for full details.