resource "random_password" "admin" {
  count   = var.administrator_password == null ? 1 : 0
  length  = 24
  special = true
}

locals {
  admin_password = coalesce(var.administrator_password, try(random_password.admin[0].result, null))
}

resource "azurerm_postgresql_flexible_server" "this" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.postgresql_version
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  administrator_login           = var.administrator_login
  administrator_password        = local.admin_password
  zone                          = var.zone
  public_network_access_enabled = var.public_network_access_enabled
  
  # Private networking
  delegated_subnet_id = var.public_network_access_enabled ? null : var.delegated_subnet_id
  private_dns_zone_id = var.public_network_access_enabled ? null : var.private_dns_zone_id

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = true

  tags = var.tags

  lifecycle {
    ignore_changes = [
      administrator_password,
      zone,
    ]
  }

  # Ensure DNS link exists before creating the server
  depends_on = [] # you will add the VNet link dependency in the root module if needed
}

# Firewall rules (public mode only)
resource "azurerm_postgresql_flexible_server_firewall_rule" "this" {
  for_each = var.public_network_access_enabled ? var.firewall_rules : {}

  name             = each.key
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}

# Databases
resource "azurerm_postgresql_flexible_server_database" "this" {
  for_each = var.databases

  name      = each.key
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = each.value.charset
  collation = each.value.collation
}