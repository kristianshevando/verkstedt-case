module "network" {
  source     = "..//..//..//modules/google/google-compute-network"
  project_id = var.project_id
  name       = var.network_name
}

resource "google_compute_subnetwork" "subnets" {
  for_each      = { for cluster in var.gke_clusters : cluster.name => cluster }

  name          = each.value.subnet_name
  ip_cidr_range = each.value.subnet_cidr
  region        = each.value.region
  network       = module.network.network_name
  project       = var.project_id
}

module "gke" {
  for_each = { for cluster in var.gke_clusters : cluster.name => cluster }

  source     = "..//..//..//modules/google/google-kubernetes-engine"
  project_id = var.project_id
  name       = each.value.name
  location   = each.value.region
  network    = module.network.network_name
  subnetwork = google_compute_subnetwork.subnets[each.key].name

  node_pools = [
    {
      name       = "default"
      node_count = each.value.node_pool_size
    }
  ]
}
