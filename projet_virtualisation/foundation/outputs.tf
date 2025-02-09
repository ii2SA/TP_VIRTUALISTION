output "kubernetes_cluster_id" {
  value = scaleway_k8s_cluster.k8s.id
}

output "registry_id" {
  value = scaleway_registry_namespace.container_registry.id
}

output "database_id" {
  value = scaleway_rdb_instance.database.id
}

output "loadbalancer_ip" {
  value = scaleway_lb.loadbalancer.ip
}

output "dns_entry" {
  value = scaleway_dns_record.dns_entry.name
}
