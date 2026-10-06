locals {
  resource_group_name = var.create_resource_group ? azurerm_resource_group.this[0].name : var.resource_group_name
  location            = var.create_resource_group ? azurerm_resource_group.this[0].location : var.location
}

resource "azurerm_resource_group" "this" {
  count = var.create_resource_group ? 1 : 0

  name     = "${var.name_prefix}-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.name_prefix}-law"
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_analytics_retention_days
  tags                = var.tags
}

resource "azurerm_container_app_environment" "this" {
  name                       = "${var.name_prefix}-env"
  location                   = local.location
  resource_group_name        = local.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
  logs_destination                = "log-analytics"
  tags                       = var.tags

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }

  
                        
}

resource "azurerm_container_app" "this" {
  for_each = var.container_apps

  name                         = "${var.name_prefix}-${each.key}"
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name          = local.resource_group_name
  revision_mode                = each.value.revision_mode
  tags                         = merge(var.tags, each.value.tags)
  
  dynamic "registry" {
    for_each = each.value.container_registry_server != null ? [1] : []
    content {
      server   = each.value.container_registry_server
      identity = each.value.user_assigned_identity_id

    }
  }

  dynamic "identity" {
    for_each = each.value.identity_type != null ? [1] : []

    content {
      type = each.value.identity_type

      identity_ids = (
        each.value.identity_type == "UserAssigned"
        ? [each.value.user_assigned_identity_id]
        : null
      )
    }
  }
  
  template {
    min_replicas = each.value.min_replicas
    max_replicas = each.value.max_replicas

    dynamic "container" {
      for_each = each.value.containers
      content {
        name   = container.value.name
        image  = container.value.image
        cpu    = container.value.cpu
        memory = container.value.memory

        dynamic "env" {
          for_each = container.value.env
          content {
            name        = env.value.name
            value       = try(env.value.value, null)
            secret_name = try(env.value.secret_name, null)
          }
        }
      }
    }
  }

  dynamic "ingress" {
    for_each = each.value.ingress != null ? [each.value.ingress] : []
    content {
      external_enabled           = ingress.value.external_enabled
      target_port                = ingress.value.target_port
      transport                  = ingress.value.transport

      traffic_weight {
        latest_revision = true
        percentage      = 100
      }
    }
  }

  dynamic "secret" {
    for_each = each.value.secrets
    content {
      name  = secret.value.name
      key_vault_secret_id = try(secret.value.azurerm_key_vault_secret_id, null)
      value = try(secret.value.value, null)
    }
  }
}
