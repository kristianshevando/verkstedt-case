# SQL Component

This component provisions a private **Cloud SQL PostgreSQL instance** and its own VPC network. The network outputs can be reused later for peering setup.

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | GCP project ID | `string` | — | Yes |
| `region` | GCP region | `string` | — | Yes |
| `network_name` | Name for the VPC network | `string` | — | Yes |
| `sql_instance_name` | Cloud SQL instance name | `string` | — | Yes |
| `sql_tier` | Tier for the SQL instance (e.g. `db-custom-1-3840`) | `string` | — | Yes |

---

## Outputs

| Name | Description |
|------|-------------|
| `network_name` | Name of the created VPC network |
| `network_self_link` | Full self-link of the network for referencing in other modules |

---

## Example `nonprod.tfvars`

```hcl
project_id         = "my-nonprod-project"
region             = "europe-west1"
network_name       = "nonprod-sql-vpc"
sql_instance_name  = "nonprod-postgres"
sql_tier           = "db-custom-1-3840"
```
