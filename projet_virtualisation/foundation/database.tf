resource "scaleway_rdb_instance" "database" {
  name        = "db-${var.env}"
  engine      = "PostgreSQL"
  user_name   = "admin"
  password    = "var.db_password"
  region      = var.region
  node_type   = "DB-DEV-M"
  volume_size = 20 

  tags = ["${var.env}", "database"]
}
