variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region where the repository will be created"
  type        = string
}

variable "repository_id" {
  description = "ID of the Artifact Registry repository (must be unique)"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
  default     = "Docker repository"
}
