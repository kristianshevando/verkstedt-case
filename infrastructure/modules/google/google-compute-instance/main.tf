resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network       = var.network
    access_config {}
  }

  metadata_startup_script = var.startup_script
}
