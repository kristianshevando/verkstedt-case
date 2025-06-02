variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
}

variable "name" {
  type        = string
  description = "The name of the cluster (required)"
}

variable "location" {
  type        = string
  description = "Region or zone to create the cluster in (required)"
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
  default     = "latest"
}

variable "node_pools" {
  type        = list(map(any))
  description = "List of maps containing node pools"
  default     = [
    {
      name       = "default-node-pool"
      node_count = 1
    }
  ]
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the cluster."
  default     = true
}
