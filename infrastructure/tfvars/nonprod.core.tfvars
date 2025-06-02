project_id   = "my-nonprod-project"
network_name = "nonprod-core-vpc"

gke_clusters = [
  {
    name           = "nonprod-cluster-eu"
    region         = "europe-west1"
    subnet_name    = "nonprod-eu-subnet"
    subnet_cidr    = "10.20.0.0/20"
    node_pool_size = 1
  }
]
