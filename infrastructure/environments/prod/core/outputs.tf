output "network_name" {
  description = "The name of the created VPC network"
  value       = module.network.network_name
}

output "network_self_link" {
  description = "The self link of the created VPC network"
  value       = module.network.network_self_link
}

output "subnet_names" {
  description = "Map of cluster name to subnet name"
  value = {
    for k, v in google_compute_subnetwork.subnets : k => v.name
  }
}

output "subnet_self_links" {
  description = "Map of cluster name to subnet self link"
  value = {
    for k, v in google_compute_subnetwork.subnets : k => v.self_link
  }
}
