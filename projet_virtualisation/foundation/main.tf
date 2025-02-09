terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.0"
    }
  }
}

provider "scaleway" {
  region     = var.region
  zone       = var.zone
  access_key = var.access_key
  secret_key = var.secret_key
  project_id = var.project_id
}

# Appel des différents blocs de configuration
module "container_registry" {
  source = "./registry"
}

module "kubernetes_cluster" {
  source = "./kubernetes"
}

module "databases" {
  source = "./database"
}

module "loadbalancers" {
  source = "./loadbalancer"
}

module "dns" {
  source = "./dns"
}
