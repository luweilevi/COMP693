
data "azurerm_key_vault" "existing" {
  name                = local.key_vault_name
  resource_group_name = "${local.resource_group_name_base}"
}

data "azurerm_key_vault_secret" "postgres_password" {
  name         = "db-password"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_container_registry" "existing" {
  name                = local.container_registry_name
  resource_group_name = "${local.resource_group_name_base}"
}