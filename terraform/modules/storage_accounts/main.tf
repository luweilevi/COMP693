resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.account_kind == "BlockBlobStorage" || var.account_kind == "FileStorage" ? null : var.access_tier

  https_traffic_only_enabled      = var.enable_https_traffic_only
  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  shared_access_key_enabled       = var.shared_access_key_enabled
  public_network_access_enabled   = var.public_network_access_enabled

  dynamic "network_rules" {
    for_each = var.network_rules != null ? [var.network_rules] : []
    content {
      default_action             = network_rules.value.default_action
      bypass                     = network_rules.value.bypass
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
    }
  }

  blob_properties {
    versioning_enabled       = try(var.blob_properties.versioning_enabled, false)
    change_feed_enabled      = try(var.blob_properties.change_feed_enabled, false)
    last_access_time_enabled = try(var.blob_properties.last_access_time_enabled, false)

    delete_retention_policy {
      days = try(var.blob_properties.delete_retention_days, 7)
    }

    container_delete_retention_policy {
      days = try(var.blob_properties.container_delete_retention_days, 7)
    }
  }

  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = var.container_access_type
}


resource "azurerm_role_assignment" "sp" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = var.role_definition_name
  principal_id         = var.service_principal_object_id

  # Optional but recommended – waits until the role is fully propagated
  skip_service_principal_aad_check = true
}