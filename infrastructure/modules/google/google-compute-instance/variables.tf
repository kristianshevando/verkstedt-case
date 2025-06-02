variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "name" {
  description = "Name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "GCP machine type (e.g. e2-medium)"
  type        = string
}

variable "zone" {
  description = "Zone in which to deploy the instance"
  type        = string
}

variable "boot_image" {
  description = "Image to use for boot disk (e.g. debian-cloud/debian-11)"
  type        = string
}

variable "network" {
  description = "Network to attach the instance to"
  type        = string
}

variable "startup_script" {
  description = "Startup script to run on instance boot"
  type        = string
  default     = ""
}
