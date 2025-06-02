# Terraform GCP Firewall Module

This module provisions a **GCP VPC firewall rule**, either for ingress or egress traffic, using `google_compute_firewall`.

---

## Features

- Supports `INGRESS` and `EGRESS` directions
- Flexible `allow` and `deny` rule definitions
- Target instances via `tags` or `service accounts`
- Optional logging and description
- Fully parameterized (no hardcoded protocol/port)

---

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | GCP project ID | `string` | — | Yes |
| `network` | VPC network name | `string` | — | Yes |
| `name` | Custom rule name (optional) | `string` | `""` | No |
| `direction` | `INGRESS` or `EGRESS` | `string` | `"INGRESS"` | No |
| `priority` | Rule priority (lower = higher) | `number` | `1000` | No |
| `disabled` | Whether rule is disabled | `bool` | `false` | No |
| `description` | Rule description | `string` | `""` | No |
| `allow_rules` | List of allow rules (protocol + ports) | `list(object)` | `[]` | No |
| `deny_rules` | List of deny rules (protocol + ports) | `list(object)` | `[]` | No |
| `source_ranges` | CIDRs allowed for ingress | `list(string)` | `[]` | No |
| `destination_ranges` | CIDRs allowed for egress | `list(string)` | `[]` | No |
| `source_tags` | Source tags (for ingress) | `list(string)` | `[]` | No |
| `target_tags` | Target tags | `list(string)` | `[]` | No |
| `target_service_accounts` | Target service accounts | `list(string)` | `[]` | No |
| `logging_metadata` | `INCLUDE_ALL` / `EXCLUDE_ALL` | `string` | `"EXCLUDE_ALL"` | No |

---

## Outputs

| Name | Description |
|------|-------------|
| `firewall_rule_name` | Name of the rule |
| `firewall_rule_id` | ID of the firewall rule |
| `firewall_rule_self_link` | GCP self-link for reference |

---

## Example Usage

```hcl
module "allow_ssh" {
  source     = "../modules/google/google-compute-firewall"
  project_id = "my-gcp-project"
  network    = "default"

  direction  = "INGRESS"
  allow_rules = [
    {
      protocol = "tcp"
      ports    = ["22"]
    }
  ]
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-access"]
}
