module "network" {
  source     = "..//..//..//modules/google/google-compute-network"
  project_id = var.project_id
  name       = var.network_name
}

module "sql_instance" {
  source          = "..//..//..//modules/google/google-sql-database-instance"
  project_id      = var.project_id
  name            = var.sql_instance_name
  region          = var.region
  tier            = var.sql_tier
  private_network = module.network.network_self_link
}
