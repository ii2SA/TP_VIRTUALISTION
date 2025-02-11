terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = ">= 2.0"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  project_id = var.project_id
  region     = var.region
}