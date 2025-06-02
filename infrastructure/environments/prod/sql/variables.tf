variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region to deploy the resources in"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network for the SQL instance"
  type        = string
}

variable "sql_instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "sql_tier" {
  description = "Machine type for Cloud SQL (e.g. db-custom-1-3840)"
  type        = string
}
