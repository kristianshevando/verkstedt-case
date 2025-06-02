output "instance_name" {
  description = "Name of the compute instance"
  value       = google_compute_instance.this.name
}

output "instance_self_link" {
  description = "Self-link of the compute instance"
  value       = google_compute_instance.this.self_link
}

output "instance_ip" {
  description = "Public IP address of the instance"
  value       = google_compute_instance.this.network_interface[0].access_config[0].nat_ip
}
