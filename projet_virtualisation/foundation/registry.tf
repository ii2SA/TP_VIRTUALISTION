resource "scaleway_registry_namespace" "container_registry" {
  name        = "container-registry-${var.env}"
  description = "Registre pour l'environnement ${var.env}"
}
