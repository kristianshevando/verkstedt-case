variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "gke_clusters" {
  description = "List of cluster configs to create"
  type = list(object({
    name           = string
    region         = string
    subnet_name    = string
    subnet_cidr    = string
    node_pool_size = number
  }))
}
