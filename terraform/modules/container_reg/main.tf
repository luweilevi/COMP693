resource "azurerm_container_registry" "acr" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}

resource "azurerm_role_assignment" "acr_push_pull" {
  role_definition_name             = var.role_definition_name
  principal_id                     = var.principal_id
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}