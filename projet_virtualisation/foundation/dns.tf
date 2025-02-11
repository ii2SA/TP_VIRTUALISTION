# Création d'un enregistrement A pour l'IP publique de l'instance
resource "scaleway_domain_record" "dns-prod" {
  dns_zone = "kiowy.net"
  name     = "calculatrice-${var.binome}-polytech-dijon"
  type     = "A"
  data     = "1.2.3.4"
  ttl      = 300
}

# Création d'un enregistrement CNAME pour l'instance
resource "scaleway_domain_record" "dns-dev" {
  dns_zone = "kiowy.net"
  name     = "calculatrice-dev-${var.binome}-polytech-dijon"
  type     = "A"
  data     = "1.2.3.5"
  ttl      = 300
}
