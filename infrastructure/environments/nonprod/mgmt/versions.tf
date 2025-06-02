terraform {
  # backend "gcs" {
  #   bucket  = "tf-state"
  #   prefix  = "terraform/state"
  # }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 5.20.0"
    }
  }
  required_version = ">= 1.8.5"
}