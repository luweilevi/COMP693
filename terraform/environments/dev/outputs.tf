
output "vnet_id" {
  value = module.vnet_dns.vnet_id
}

output "subnet_ids" {
  value = module.vnet_dns.subnet_ids
}

output "private_dns_zone_id" {
  value = module.vnet_dns.private_dns_zone_id
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "db_server_fqdn" {
  value = module.postgres_dev.fqdn
}

output "admin_username" {
  value = module.postgres_dev.administrator_login
}

output "db_name" {
  value = module.postgres_dev.database_names[0] 
}