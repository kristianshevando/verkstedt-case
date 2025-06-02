variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "name" {
  description = "Name of the SQL instance"
  type        = string
}

variable "region" {
  description = "Region in which to deploy the instance"
  type        = string
}

variable "database_version" {
  description = "Cloud SQL database version (e.g. POSTGRES_14)"
  type        = string
  default     = "POSTGRES_14"
}

variable "tier" {
  description = "Instance machine type (e.g. db-custom-1-3840)"
  type        = string
}

variable "availability_type" {
  description = "Availability type: ZONAL or REGIONAL"
  type        = string
  default     = "REGIONAL"
}

variable "backup_enabled" {
  description = "Enable automatic backups"
  type        = bool
  default     = true
}

variable "ipv4_enabled" {
  description = "Enable public IP access"
  type        = bool
  default     = false
}

variable "private_network" {
  description = "Private VPC network to attach (use self-link)"
  type        = string
  default     = ""
}