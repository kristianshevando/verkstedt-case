output "cluster_id" {
  description = "The ID of the GKE cluster resource"
  value       = google_container_cluster.this.id
}

output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.this.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.this.endpoint
}