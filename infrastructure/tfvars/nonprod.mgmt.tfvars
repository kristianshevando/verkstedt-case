project_id      = "my-nonprod-project"
network_name    = "nonprod-mgmt-vpc"
registry_name   = "docker-nonprod"
registry_region = "europe-west1"

instances = [
  {
    name          = "bastion-eu"
    region        = "europe-west1"
    zone          = "europe-west1-b"
    subnet_name   = "mgmt-eu-subnet"
    subnet_cidr   = "10.50.0.0/24"
    machine_type  = "e2-medium"
    boot_image    = "debian-cloud/debian-11"
  }
]
