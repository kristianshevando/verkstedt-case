output "network_name" {
  description = "Name of the mgmt VPC network"
  value       = module.network.network_name
}

output "network_self_link" {
  description = "Self link of the mgmt VPC network"
  value       = module.network.network_self_link
}

output "registry_repository" {
  description = "Docker registry repository name"
  value       = module.docker_registry.repository_id
}
