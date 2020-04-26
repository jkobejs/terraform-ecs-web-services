# Autoscaling Group config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_security\_group\_id | ID of ALB security group | `string` | n/a | yes |
| cluster\_name | n/a | `string` | `"ecs-terraform-dev"` | no |
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group | `number` | n/a | yes |
| environment | n/a | `string` | `"dev"` | no |
| instance\_type | EC2 instance type | `string` | n/a | yes |
| max\_size | The maximum size of the auto scale group | `number` | n/a | yes |
| min\_size | The minimum size of the auto scale group | `number` | n/a | yes |
| name | n/a | `string` | `"ecs-terraform"` | no |
| subnet\_ids | List of subnet ids to place the auto scaling grou in | `list(string)` | n/a | yes |
| vpc\_id | Id of VPC to place load balancer resources in | `string` | n/a | yes |
| wait\_for\_capacity\_timeout | Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over min\_elb\_capacity behavior. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| container\_instance\_security\_group\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->