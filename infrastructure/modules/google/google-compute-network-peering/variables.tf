variable "name" {
  description = "Name of the peering connection"
  type        = string
}

variable "network_self_link" {
  description = "Self link of the local VPC network"
  type        = string
}

variable "peer_network_self_link" {
  description = "Self link of the peer VPC network"
  type        = string
}

variable "export_custom_routes" {
  description = "Whether to export custom routes"
  type        = bool
  default     = true
}

variable "import_custom_routes" {
  description = "Whether to import custom routes"
  type        = bool
  default     = true
}
