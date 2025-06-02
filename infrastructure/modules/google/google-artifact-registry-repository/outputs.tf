output "repository_id" {
  description = "The ID of the Artifact Registry repository"
  value       = google_artifact_registry_repository.this.repository_id
}

output "repository_location" {
  description = "Region where the repository is deployed"
  value       = google_artifact_registry_repository.this.location
}
