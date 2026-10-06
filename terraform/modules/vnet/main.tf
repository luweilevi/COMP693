# Virtual Network
resource "azurerm_virtual_network" "this" {
  name                = "${var.name_prefix}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

# Subnets
resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes
}

# Private DNS Zone
resource "azurerm_private_dns_zone" "this" {
  count               = var.private_dns_zone_name != "" ? 1 : 0
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# Link Private DNS Zone to VNet
resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  count = var.enable_vnet_link ? 1 : 0

  name                 = "${var.name_prefix}-vnet-link"
  private_dns_zone_id  = azurerm_private_dns_zone.this[count.index].id
  virtual_network_id   = azurerm_virtual_network.this.id
  registration_enabled = var.registration_enabled
  tags                 = var.tags
}