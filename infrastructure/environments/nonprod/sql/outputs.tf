output "network_name" {
  description = "Name of the sql VPC network"
  value       = module.network.network_name
}

output "network_self_link" {
  description = "Self link of the sql VPC network"
  value       = module.network.network_self_link
}
