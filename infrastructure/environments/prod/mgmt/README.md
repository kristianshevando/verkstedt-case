# mgmt Component (GCP)

This Terraform configuration provisions the **management infrastructure** in GCP, including:

- A custom VPC network
- One subnet per compute instance
- One or more VM instances (e.g., bastion, CI runners)
- Docker Artifact Registry

---

## Input Variables

| Name             | Description                                 | Type | Default | Required |
|------------------|---------------------------------------------|------|---------|----------|
| `project_id`     | GCP project ID                              | string | — | Yes |
| `network_name`   | Name of the VPC network                     | string | — | Yes |
| `registry_name`  | Name of Docker Artifact Registry            | string | — | Yes |
| `registry_region`| Region for the registry                     | string | — | Yes |
| `instances`      | List of instance definitions with metadata  | list(object) | — | Yes |

---

## Outputs

| Name | Description |
|------|-------------|
| `network_name` | Name of the VPC network |
| `network_self_link` | Full GCP link to the VPC |
| `registry_repository` | Docker registry repository ID |

---

## Example `nonprod.tfvars`

```hcl
project_id      = "my-nonprod-project"
network_name    = "nonprod-mgmt-vpc"
registry_name   = "docker-nonprod"
registry_region = "europe-west1"

instances = [
  {
    name          = "bastion-eu"
    region        = "europe-west1"
    zone          = "europe-west1-b"
    subnet_name   = "mgmt-eu-subnet"
    subnet_cidr   = "10.50.0.0/24"
    machine_type  = "e2-medium"
    boot_image    = "debian-cloud/debian-11"
  }
]
