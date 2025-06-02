output "peering_core_sql_name" {
  value       = module.peering_core_sql.peering_name
  description = "Name of the peering from core to sql"
}

output "peering_core_mgmt_name" {
  value       = module.peering_core_mgmt.peering_name
  description = "Name of the peering from core to mgmt"
}
