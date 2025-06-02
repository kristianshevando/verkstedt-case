# GCP VPC Network Peering Module

This Terraform module creates a one-way VPC Network Peering connection between two GCP VPC networks. For full connectivity, this module must be called twice — one from each side.

---

## Input Variables

| Name | Description | Type    | Default | Required |
|------|-------------|---------|---------|----------|
| `name` | Name of the peering | string | — | Yes |
| `network_self_link` | Self link of the source network | string | — | Yes |
| `peer_network_self_link` | Self link of the destination/peer network | string  | — | Yes |
| `export_custom_routes` | Export custom routes from this network | bool | `true` | No |
| `import_custom_routes` | Import custom routes from peer network | bool | `true` | No |

---

## Outputs

| Name | Description |
|------|-------------|
| `peering_name` | Name of the created peering connection |

---

## Example Usage

```hcl
module "peer_mgmt_to_core" {
  source = "..//..//..//modules/google/google-compute-network-peering"

  name                   = "mgmt-to-core"
  network_self_link      = data.terraform_remote_state.mgmt.outputs.network_self_link
  peer_network_self_link = data.terraform_remote_state.core.outputs.network_self_link
}

module "peer_core_to_mgmt" {
  source = "..//..//..//modules/google/google-compute-network-peering"

  name                   = "core-to-mgmt"
  network_self_link      = data.terraform_remote_state.core.outputs.network_self_link
  peer_network_self_link = data.terraform_remote_state.mgmt.outputs.network_self_link
}
