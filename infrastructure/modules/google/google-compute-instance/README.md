# Terraform GCP Compute Instance Module

This module provisions a **GCP Compute Engine instance** with minimal configurable parameters.

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | GCP project ID | `string` | — | Yes |
| `name` | Name of the compute instance | `string` | — | Yes |
| `machine_type` | Type of VM to use | `string` | — | Yes |
| `zone` | Zone in which to deploy the instance | `string` | — | Yes |
| `boot_image` | Boot image (e.g. `debian-cloud/debian-11`) | `string` | — | Yes |
| `network` | Name or self-link of the network | `string` | — | Yes |
| `startup_script` | Startup script to run on boot | `string` | `""` | No |

---

## Outputs

| Name | Description |
|------|-------------|
| `instance_name` | Name of the compute instance |
| `instance_self_link` | Self-link of the compute instance |
| `instance_ip` | Public IP address of the instance |

---

## Example Usage

```hcl
module "bastion" {
  source          = "../modules/google/google-compute-instance"
  project_id      = "my-gcp-project"
  name            = "bastion"
  machine_type    = "e2-medium"
  zone            = "europe-west1-b"
  boot_image      = "debian-cloud/debian-11"
  network         = "default"
  startup_script  = "echo Hello from Bastion"
}
```
