# Terraform GCP SQL Instance Module

This module provisions a **PostgreSQL Cloud SQL instance** in GCP with private IP support.

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | GCP project ID | `string` | — | Yes |
| `name` | SQL instance name | `string` | — | Yes |
| `region` | Region to deploy the instance in | `string` | — | Yes |
| `database_version` | Version of PostgreSQL | `string` | `"POSTGRES_14"` | No |
| `tier` | Machine tier (e.g. `db-custom-1-3840`) | `string` | — | Yes |
| `availability_type` | `REGIONAL` or `ZONAL` | `string` | `"REGIONAL"` | No |
| `backup_enabled` | Enable automatic backups | `bool` | `true` | No |
| `ipv4_enabled` | Enable public IP access | `bool` | `false` | No |
| `private_network` | VPC self-link for private IP | `string` | `""` | No |

---

## Outputs

| Name | Description |
|------|-------------|
| `instance_name` | Name of the SQL instance |
| `connection_name` | Connection string (project:region:name) |
| `self_link` | Resource self-link |

---

## Example Usage

```hcl
module "sql_instance" {
  source            = "../modules/google/google-sql-database-instance"
  project_id        = "my-project"
  name              = "prod-postgres"
  region            = "europe-west1"
  tier              = "db-custom-1-3840"
  private_network   = module.network.network_self_link
}
```
