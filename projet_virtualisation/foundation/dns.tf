resource "scaleway_dns_record" "dns_entry" {
  domain = var.dns_base
  name   = "${var.env == "production" ? "calculatrice" : "calculatrice-dev"}-nombinome1-nombinome2"
  type   = "A"
  ttl    = 300

  records = [
    scaleway_lb.loadbalancer.ip
  ]
}
