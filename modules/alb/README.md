# Application load balancer config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | n/a | `string` | n/a | yes |
| name | n/a | `string` | n/a | yes |
| public\_subnet\_ids | List of public subnet ids to place the loadbalancer in | `list(string)` | n/a | yes |
| vpc\_id | Id of VPC to place load balancer resources in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| default\_traget\_group\_arn | n/a |
| dns\_name | n/a |
| ecs\_role\_arn | n/a |
| id | n/a |
| name | n/a |
| security\_group\_id | n/a |
| traget\_group\_arns | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->