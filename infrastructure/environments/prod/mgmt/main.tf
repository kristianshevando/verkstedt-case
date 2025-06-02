module "network" {
  source     = "..//..//..//modules/google/google-compute-network"
  project_id = var.project_id
  name       = var.network_name
}

module "subnets" {
  source   = "..//..//..//modules/google/google-compute-subnetwork"
  for_each = { for instance in var.instances : instance.name => instance }

  project_id    = var.project_id
  name          = each.value.subnet_name
  region        = each.value.region
  network       = module.network.network_name
  ip_cidr_range = each.value.subnet_cidr
}

module "instances" {
  source   = "..//..//..//modules/google/google-compute-instance"
  for_each = { for instance in var.instances : instance.name => instance }

  project_id     = var.project_id
  name           = each.value.name
  zone           = each.value.zone
  machine_type   = each.value.machine_type
  boot_image     = each.value.boot_image
  network        = module.network.network_name
  startup_script = "echo Hello from ${each.value.name}"
}

module "docker_registry" {
  source = "..//..//..//modules/google/google-artifact-registry-repository"
  
  project_id    = var.project_id
  region        = var.registry_region
  repository_id = var.registry_name
}
