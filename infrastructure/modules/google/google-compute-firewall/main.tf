resource "google_compute_firewall" "this" {
  name    = var.name != "" ? var.name : "${var.network}-fw-${lower(var.direction)}"
  network = var.network
  project = var.project_id

  direction = var.direction
  priority  = var.priority
  disabled  = var.disabled

  dynamic "allow" {
    for_each = var.allow_rules
    content {
      protocol = allow.value.protocol
      ports    = try(allow.value.ports, null)
    }
  }

  dynamic "deny" {
    for_each = var.deny_rules
    content {
      protocol = deny.value.protocol
      ports    = try(deny.value.ports, null)
    }
  }

  source_ranges      = var.direction == "INGRESS" ? var.source_ranges : null
  source_tags        = var.direction == "INGRESS" ? var.source_tags : null
  destination_ranges = var.direction == "EGRESS"  ? var.destination_ranges : null
  target_tags        = var.target_tags
  target_service_accounts = var.target_service_accounts

  description = var.description
  log_config {
    metadata = var.logging_metadata
  }
}
