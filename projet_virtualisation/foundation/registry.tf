resource "scaleway_registry_namespace" "container_registry" {
  name        = "container-registry"
  description = "Registre pour les contezneurs de la calculatrice"
  project_id  = var.project_id
  region      = "fr-par"
}

