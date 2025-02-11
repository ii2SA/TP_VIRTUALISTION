resource "scaleway_rdb_instance" "db-dev" {
  name           = "calculatrice-db-dev"
  engine         = "PostgreSQL-15"
  project_id     = var.project_id
  is_ha_cluster  = true
  disable_backup = true
  user_name      = "admin"
  password       = var.db_password
  region         = var.region
  node_type      = "DEV-S"
  tags           = ["Environnement de developpement"]
}

resource "scaleway_rdb_instance" "db-prod" {
  name           = "calculatrice-db-prod"
  engine         = "PostgreSQL-15"
  project_id     = var.project_id
  is_ha_cluster  = true
  disable_backup = true
  user_name      = "admin"
  password       = var.db_password
  region         = var.region
  node_type      = "DEV-S"
  tags           = ["Environnement de production"]
}
