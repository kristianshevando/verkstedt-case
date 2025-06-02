# Terraform GCP Subnet Module

This module creates a minimal **GCP subnetwork** inside a specified VPC.

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | GCP project ID | `string` | — | Yes |
| `name` | Name of the subnetwork | `string` | — | Yes |
| `region` | Region where subnet is created | `string` | — | Yes |
| `network` | VPC network name or self-link | `string` | — | Yes |
| `ip_cidr_range` | CIDR range for the subnet | `string` | — | Yes |

---

## Outputs

| Name | Description |
|------|-------------|
| `subnet_name` | Subnet name |
| `subnet_self_link` | Self-link of the subnet |

---

## Example Usage

```hcl
module "subnet" {
  source         = "../modules/google/google-compute-subnet"
  project_id     = "my-gcp-project"
  name           = "subnet-core"
  region         = "europe-west1"
  network        = "vpc-main"
  ip_cidr_range  = "10.0.10.0/24"
}
```
