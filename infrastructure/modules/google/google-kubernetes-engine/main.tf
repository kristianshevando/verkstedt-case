resource "google_container_cluster" "this" {
  name                = var.name
  project             = var.project_id
  location            = var.location
  network             = var.network
  subnetwork          = var.subnetwork
  min_master_version  = var.kubernetes_version
  deletion_protection = var.deletion_protection

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_container_node_pool" "this" {
  for_each   = { for pool in var.node_pools : pool.name => pool }
  
  name       = each.key
  project    = var.project_id
  location   = var.location
  cluster    = google_container_cluster.this.name
  version    = google_container_cluster.this.min_master_version
  node_count = each.value.node_count

  lifecycle {
    prevent_destroy = true
  }
}