resource "scaleway_k8s_cluster" "cluster" {
  name                        = "calculatrice-cluster"
  project_id                  = var.project_id
  version                     = "1.29.1"
  cni                         = "cilium"
  region                      = var.region
  tags                        = ["calculatrice-cloud-native"]
  delete_additional_resources = false
}

resource "scaleway_k8s_pool" "default_pool" {
  cluster_id  = scaleway_k8s_cluster.cluster.id
  name        = "calculatrice-default-pool"
  size        = 3
  node_type   = "DEV1-M"
  autohealing = true
  region      = var.region
}
