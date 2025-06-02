output "subnet_name" {
  description = "Name of the subnet"
  value       = google_compute_subnetwork.this.name
}

output "subnet_self_link" {
  description = "Self-link of the subnet"
  value       = google_compute_subnetwork.this.self_link
}
