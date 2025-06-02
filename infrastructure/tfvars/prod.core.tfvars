project_id   = "my-prod-project"
network_name = "prod-core-vpc"

gke_clusters = [
  {
    name           = "prod-cluster-eu"
    region         = "europe-west1"
    subnet_name    = "prod-eu-subnet"
    subnet_cidr    = "10.30.0.0/20"
    node_pool_size = 3
  },
  {
    name           = "prod-cluster-us"
    region         = "us-central1"
    subnet_name    = "prod-us-subnet"
    subnet_cidr    = "10.31.0.0/20"
    node_pool_size = 3
  }
]
