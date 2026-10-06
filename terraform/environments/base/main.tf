module "resource_group" {
  source = "../../modules/resource_group"

  name     = local.resource_group_name
  location = local.rg_location
  tags     = local.tags
}

module "container_registry" {
  source = "../../modules/container_reg"

  name                          = local.container_registry_name
  location                      = module.resource_group.location
  resource_group_name           = module.resource_group.name
  public_network_access_enabled = true

  sku                  = "Basic"
  admin_enabled        = true
  principal_id         = local.service_principal_id
  role_definition_name = "Container Registry Repository Writer" # or "Storage Blob Data Contributor", "Storage Blob Data Owner", etc.
  tags                 = local.tags
}

# Created using azure cli command: az ad sp create-for-rbac --name "lincolnsp" --role contributor --scopes /subscriptions/<subscription_id> --sdk-auth

module "storage" {
  source = "../../modules/storage_accounts"

  name                     = local.storage_account_name          # must be globally unique
  resource_group_name      = module.resource_group.name
  location                 = module.resource_group.location

  public_network_access_enabled   = true
  account_tier             = "Standard"
  account_replication_type = "LRS"

  service_principal_object_id = local.service_principal_id
  role_definition_name        = "Storage Blob Data Contributor"   # or "Storage Blob Data Owner", "Storage Blob Data Reader", etc.

  tags = local.tags

  container_name = local.storage_container_name
  container_access_type = "private"
}

module "key_vault" {
    
  source = "../../modules/key_vault"
  tenant_id                   = local.tenant_id
  name                          = local.key_vault_name
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  sku_name                      = "standard"

  tags = local.tags
}