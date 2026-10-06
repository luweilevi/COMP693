
resource "azurerm_user_assigned_identity" "container_app_identity" {
  name                = "aca-identity"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}


module "container_app" {
  
  source = "../../modules/container_apps"
  name_prefix                         = "demo-app-dev"
  create_resource_group                = false
  resource_group_name                 = module.resource_group.name
  location                            = module.resource_group.location
  log_analytics_retention_days        = 30
  container_apps = {
    web-app = {
      identity_type = "UserAssigned"
      user_assigned_identity_id = azurerm_user_assigned_identity.container_app_identity.id
      revision_mode = "Single"
      min_replicas  = 1
      max_replicas  = 3
      container_registry_server = data.azurerm_container_registry.existing.login_server

      containers = [
        {
          name   = "api"
          image  = "${local.container_registry_name}.azurecr.io/${var.image_name}:${var.image_tag}"
          cpu    = 0.5
          memory = "1Gi"
          env = [
            {
              name  = "ENVIRONMENT"
              value = "dev"
            },
            {
              name  = "DB_PASSWORD"
              secret_name = "db-connection-string"
            },         
            {
                name  = "DB_NAME"
                value = "demo_db"
            },
            {
                name  = "DB_HOST"
                value = module.postgres_dev.fqdn
            },
            {
                name  = "DB_PORT"
                value = "5432"
            }
          ]
        }
      ]

      ingress = {
        external_enabled           = true
        target_port                = 5000
        transport                  = "http"
      },
      secrets = [
        {
          name  = "db-connection-string"
          value = data.azurerm_key_vault_secret.postgres_password.value
        }
      ]
    }
  }
  depends_on = [module.postgres_dev, azurerm_user_assigned_identity.container_app_identity]

}

resource "azurerm_role_assignment" "container_app_acr_pull" {
  scope                = data.azurerm_container_registry.existing.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.container_app_identity.principal_id
}
