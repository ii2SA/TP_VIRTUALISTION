variable "region" {
  description = "Région Scaleway"
  default     = "fr-par"
}

variable "project_id" {
  description = "ID du projet Scaleway de clacultrice native"
  type        = string
  default     = "12345678-90ab-cdef-1234-567890abcdef"
}

variable "binome" {
  description = "Nom du binome"
  default     = "itong-noufename"
  type        = string
}

variable "db_password" {
  description = "Mot de passe pour la base de données"
  type        = string
  sensitive   = true
}
