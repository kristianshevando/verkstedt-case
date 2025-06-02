# Terraform GKE Module

This module provisions a **GCP GKE cluster** along with one or more node pools. It is flexible and uses input variables for Kubernetes version, networking, and scaling.

---

## Features

- Creates a GKE control plane
- Creates multiple named node pools
- Supports VPC and subnetwork attachment
- Allows cluster version pinning
- Enables lifecycle protections (prevent destroy)
- Outputs cluster endpoint, location, and node pool links

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | The project ID to host the cluster | `string` | — | Yes |
| `name` | Name of the GKE cluster | `string` | — | Yes |
| `location` | Region or zone to create the cluster in | `string` | — | Yes |
| `network` | The VPC network to use | `string` | — | Yes |
| `subnetwork` | The subnetwork to use | `string` | — | Yes |
| `kubernetes_version` | Kubernetes version (e.g. "1.29", "latest") | `string` | `"latest"` | No |
| `node_pools` | List of node pools with name and count | `list(map(any))` | `[ { name = "default-node-pool", node_count = 1 } ]` | No |
| `deletion_protection` | Prevent accidental deletion of the cluster | `bool` | `true` | No |

---

## Outputs

| Name | Description |
|------|-------------|
| `cluster_id` | Internal GCP resource ID |
| `cluster_name` | Name of the created GKE cluster |
| `cluster_endpoint` | API endpoint of the cluster |

---

## Example Usage

```hcl
module "gke" {
  source  = "../modules/google/google-kubernetes-engine"

  project_id = "my-project-id"
  name       = "demo-cluster"
  location   = "europe-west1"
  network    = "default"
  subnetwork = "default-subnet"

  kubernetes_version = "latest"

  node_pools = [
    {
      name       = "default-node-pool"
      node_count = 2
    }
  ]
}
