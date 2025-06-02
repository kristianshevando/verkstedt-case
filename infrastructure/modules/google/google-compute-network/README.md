# Terraform GCP Network Module

This module provisions a **custom GCP VPC network** with auto subnet creation disabled.

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | GCP project ID | `string` | — | Yes |
| `name` | Name of the VPC network | `string` | — | Yes |

---

## Outputs

| Name | Description |
|------|-------------|
| `network_name` | Name of the created VPC |
| `network_self_link` | Self-link of the VPC for reference |

---

## Example Usage

```hcl
module "network" {
  source     = "../modules/google/google-compute-network"
  project_id = "my-gcp-project"
  name       = "main-vpc"
}
```
