# VPC config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azs | n/a | `list(string)` | n/a | yes |
| cidr | n/a | `string` | n/a | yes |
| database\_subnets | n/a | `list(string)` | n/a | yes |
| enable\_nat\_gateway | n/a | `bool` | n/a | yes |
| environment | n/a | `string` | n/a | yes |
| name | n/a | `string` | n/a | yes |
| one\_nat\_gateway\_per\_az | n/a | `bool` | n/a | yes |
| private\_subnets | n/a | `list(string)` | n/a | yes |
| public\_subnets | n/a | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| database\_subnet\_ids | List of IDs of database subnets |
| id | The ID of the VPC |
| private\_subnet\_ids | List of IDs of private subnets |
| public\_subnet\_ids | List of IDs of public subnets |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->