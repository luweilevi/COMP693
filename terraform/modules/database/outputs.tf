output "id" {
  description = "PostgreSQL Flexible Server ID"
  value       = azurerm_postgresql_flexible_server.this.id
}

output "name" {
  description = "PostgreSQL Flexible Server name"
  value       = azurerm_postgresql_flexible_server.this.name
}

output "fqdn" {
  description = "Fully qualified domain name"
  value       = azurerm_postgresql_flexible_server.this.fqdn
}

output "administrator_login" {
  description = "Administrator login"
  value       = azurerm_postgresql_flexible_server.this.administrator_login
}

/*
output "administrator_password" {
  description = "Administrator password (sensitive)"
  value       = local.admin_password
  sensitive   = true
}
*/

output "database_ids" {
  description = "Map of database names to IDs"
  value       = { for k, v in azurerm_postgresql_flexible_server_database.this : k => v.id }
}

output "database_names" {
  description = "List of database names"
  value       = [for db in azurerm_postgresql_flexible_server_database.this : db.name]
}