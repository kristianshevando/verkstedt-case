output "peering_name" {
  description = "Name of the peering connection"
  value       = google_compute_network_peering.this.name
}
