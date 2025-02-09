variable "region" {
  description = "Région Scaleway"
  default     = "fr-par"
}

variable "zone" {
  description = "Zone Scaleway"
  default     = "fr-par-1"
}

variable "access_key" {
  description = "Clé d'accès Scaleway"
}

variable "secret_key" {
  description = "Clé secrète Scaleway"
}

variable "project_id" {
  description = "ID du projet Scaleway"
}

variable "env" {
  description = "Environnement (production ou development)"
  type        = string
}

variable "dns_base" {
  description = "Base des entrées DNS"
  default     = "polytech-dijon.kiowy.net"
}

variable "db_password" {
  description = "Mot de passe pour la base de données"
  type        = string
  sensitive   = true
}
