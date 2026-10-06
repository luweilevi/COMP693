output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = "Map of subnet name → subnet ID"
  value       = { for k, s in azurerm_subnet.this : k => s.id }
}

output "private_dns_zone_id" {
  description = "ID of the Private DNS Zone"
  value       = try(azurerm_private_dns_zone.this[0].id, null)
}

output "private_dns_zone_name" {
  description = "Name of the Private DNS Zone"
  value       = try(azurerm_private_dns_zone.this[0].name, null)
}

output "vnet_link_id" {
  description = "ID of the Private DNS Zone VNet link (if created)"
  value       = try(azurerm_private_dns_zone_virtual_network_link.this[0].id, null)
}