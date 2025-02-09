resource "scaleway_k8s_cluster" "k8s" {
  name         = "k8s-cluster-${var.env}"
  version      = "1.26"
  cni          = "cilium"
  region       = var.region
  tags         = ["${var.env}", "k8s"]

  pool {
    name     = "default-pool"
    size     = 3
    node_type = "DEV1-M"
    autoscaler {
      enable      = true
      min_size    = 1
      max_size    = 5
    }
  }
}
