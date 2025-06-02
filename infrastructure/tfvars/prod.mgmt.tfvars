project_id      = "my-prod-project"
network_name    = "prod-mgmt-vpc"
registry_name   = "docker-prod"
registry_region = "us-central1"

instances = [
  {
    name          = "bastion-eu"
    region        = "europe-west1"
    zone          = "europe-west1-b"
    subnet_name   = "mgmt-eu-subnet"
    subnet_cidr   = "10.40.0.0/24"
    machine_type  = "e2-medium"
    boot_image    = "debian-cloud/debian-11"
  },
  {
    name          = "runner-us"
    region        = "us-central1"
    zone          = "us-central1-a"
    subnet_name   = "mgmt-us-subnet"
    subnet_cidr   = "10.41.0.0/24"
    machine_type  = "e2-medium"
    boot_image    = "debian-cloud/debian-11"
  }
]
