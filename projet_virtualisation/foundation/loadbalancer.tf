resource "scaleway_lb_ip" "prod_ip" {
  project_id = var.project_id
  zone       = "fr-par-1"
}

resource "scaleway_lb_ip" "dev_ip" {
  project_id = var.project_id
  zone       = "fr-par-1"
}

resource "scaleway_lb" "lb_prod" {
  name       = "calculatrice-lb-prod"
  project_id = var.project_id
  zone       = "fr-par-1"
  ip_id      = scaleway_lb_ip.prod_ip.id
  type       = "lb"
}

resource "scaleway_lb" "lb_dev" {
  name       = "calculatrice-lb-dev"
  project_id = var.project_id
  zone       = "fr-par-1"
  ip_id      = scaleway_lb_ip.dev_ip.id
  type       = "lb"
}