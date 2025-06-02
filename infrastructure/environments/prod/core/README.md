# Core (GKE) Component

This component provisions a shared VPC and one or more GKE clusters across different regions. Each cluster uses its own regional subnet.

---

## Features

- Creates one VPC network
- Supports multiple GKE clusters via a single config
- Automatically provisions subnetworks
- Designed for regional HA setups
- Outputs subnet and network links for peering

---

## Input Variables

| Name | Description | Type | Required |
|------|-------------|------|----------|
| `project_id` | GCP project ID | `string` | Yes |
| `network_name` | VPC network name | `string` | Yes |
| `gke_clusters` | List of cluster configurations | `list(object)` | Yes |

Each `gke_clusters` entry should include:

```hcl
{
  name           = string
  region         = string
  subnet_name    = string
  subnet_cidr    = string
  node_pool_size = number
}
```

---

## Outputs

| Name | Description |
|------|-------------|
| `network_name` | VPC network name |
| `network_self_link` | Full URI of the network |
| `subnet_names` | Map of cluster name to subnet name |
| `subnet_self_links` | Map of cluster name to subnet URI |

---

## Example `nonprod.tfvars`

```hcl
project_id   = "my-nonprod-project"
network_name = "nonprod-core-vpc"

gke_clusters = [
  {
    name           = "nonprod-cluster-eu"
    region         = "europe-west1"
    subnet_name    = "nonprod-eu-subnet"
    subnet_cidr    = "10.20.0.0/20"
    node_pool_size = 1
  },
  {
    name           = "nonprod-cluster-us"
    region         = "us-central1"
    subnet_name    = "nonprod-us-subnet"
    subnet_cidr    = "10.21.0.0/20"
    node_pool_size = 1
  }
]
```

---

## Example `prod.tfvars`

```hcl
project_id   = "my-prod-project"
network_name = "prod-core-vpc"

gke_clusters = [
  {
    name           = "prod-cluster-eu"
    region         = "europe-west1"
    subnet_name    = "prod-eu-subnet"
    subnet_cidr    = "10.30.0.0/20"
    node_pool_size = 3
  },
  {
    name           = "prod-cluster-us"
    region         = "us-central1"
    subnet_name    = "prod-us-subnet"
    subnet_cidr    = "10.31.0.0/20"
    node_pool_size = 3
  }
]
```
