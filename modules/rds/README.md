# RDS config

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
| container\_instance\_security\_group\_id | Container instance security group id | `string` | n/a | yes |
| db\_name | Database name | `string` | n/a | yes |
| environment | Database environment | `string` | n/a | yes |
| instance\_type | Database instance type | `string` | n/a | yes |
| name | Service name | `string` | n/a | yes |
| password | Database password | `string` | n/a | yes |
| subnet\_ids | List of database subnet ids to place the database in | `list(string)` | n/a | yes |
| username | Database username | `string` | n/a | yes |
| vpc\_id | Id of VPC to place load balancer resources in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| host | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->