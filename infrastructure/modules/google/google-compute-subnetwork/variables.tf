variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "region" {
  description = "Region where the subnet will be created"
  type        = string
}

variable "network" {
  description = "Name or self-link of the VPC network"
  type        = string
}

variable "ip_cidr_range" {
  description = "Primary CIDR range for the subnet"
  type        = string
}
