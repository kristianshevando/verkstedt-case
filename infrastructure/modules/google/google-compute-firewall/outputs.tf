output "firewall_rule_name" {
  description = "The name of the firewall rule"
  value       = google_compute_firewall.this.name
}

output "firewall_rule_id" {
  description = "The ID of the firewall rule"
  value       = google_compute_firewall.this.id
}

output "firewall_rule_self_link" {
  description = "The self-link of the firewall rule"
  value       = google_compute_firewall.this.self_link
}
