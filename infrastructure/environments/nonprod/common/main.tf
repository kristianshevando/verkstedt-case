provider "google" {
  project = var.project_id
}

data "terraform_remote_state" "core" {
  backend = "gcs"
  config = {
    bucket = var.core_state_bucket
    prefix = var.core_state_prefix
  }
}

data "terraform_remote_state" "sql" {
  backend = "gcs"
  config = {
    bucket = var.sql_state_bucket
    prefix = var.sql_state_prefix
  }
}

data "terraform_remote_state" "mgmt" {
  backend = "gcs"
  config = {
    bucket = var.mgmt_state_bucket
    prefix = var.mgmt_state_prefix
  }
}

module "peering_core_sql" {
  source = "..//..//..//modules/google/google-compute-network-peering"

  name                   = "core-to-sql"
  network_self_link      = data.terraform_remote_state.core.outputs.network_self_link
  peer_network_self_link = data.terraform_remote_state.sql.outputs.network_self_link
}

module "peering_sql_core" {
  source = "..//..//..//modules/google/google-compute-network-peering"

  name                   = "sql-to-core"
  network_self_link      = data.terraform_remote_state.sql.outputs.network_self_link
  peer_network_self_link = data.terraform_remote_state.core.outputs.network_self_link
}

module "peering_core_mgmt" {
  source = "..//..//..//modules/google/google-compute-network-peering"

  name                   = "core-to-mgmt"
  network_self_link      = data.terraform_remote_state.core.outputs.network_self_link
  peer_network_self_link = data.terraform_remote_state.mgmt.outputs.network_self_link
}

module "peering_mgmt_core" {
  source = "..//..//..//modules/google/google-compute-network-peering"

  name                   = "mgmt-to-core"
  network_self_link      = data.terraform_remote_state.mgmt.outputs.network_self_link
  peer_network_self_link = data.terraform_remote_state.core.outputs.network_self_link
}
