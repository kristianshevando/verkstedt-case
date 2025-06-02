resource "google_sql_database_instance" "this" {
  name             = var.name
  database_version = var.database_version
  region           = var.region
  project          = var.project_id

  settings {
    tier              = var.tier
    availability_type = var.availability_type

    backup_configuration {
      enabled = var.backup_enabled
    }

    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.private_network
    }
  }

  deletion_protection = true
}
