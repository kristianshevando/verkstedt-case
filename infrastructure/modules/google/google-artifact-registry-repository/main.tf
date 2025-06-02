resource "google_artifact_registry_repository" "this" {
  location      = var.region
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"
  project       = var.project_id
}
