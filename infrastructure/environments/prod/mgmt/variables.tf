variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "registry_name" {
  description = "Name of the Docker Artifact Registry"
  type        = string
}

variable "registry_region" {
  description = "Region where Docker registry will be deployed"
  type        = string
}

variable "instances" {
  description = "List of mgmt compute instance definitions"
  type = list(object({
    name          = string
    region        = string
    zone          = string
    subnet_name   = string
    subnet_cidr   = string
    machine_type  = string
    boot_image    = string
  }))
}
