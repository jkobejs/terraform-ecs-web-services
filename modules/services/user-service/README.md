# User service config

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
| alb\_ecs\_role\_arn | Role arn to place task in traget groups | `string` | n/a | yes |
| alb\_traget\_group\_arn | Traget group arns in which place service | `string` | n/a | yes |
| db\_host | RDS host to connect service to | `string` | n/a | yes |
| db\_name | RDS database to connect service to | `string` | n/a | yes |
| db\_password | RDS password | `string` | n/a | yes |
| db\_username | RDS username | `string` | n/a | yes |
| ecs\_cluster\_id | Id of cluster to run service in | `string` | n/a | yes |
| ecs\_cluster\_name | Cluster name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecr\_arn | n/a |
| ecr\_id | n/a |
| erc\_url | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->