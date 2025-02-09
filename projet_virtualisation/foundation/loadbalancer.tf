resource "scaleway_lb" "loadbalancer" {
  name        = "loadbalancer-${var.env}"
  description = "LoadBalancer pour l'environnement ${var.env}"
  region      = var.region
}
