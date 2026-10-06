output "resource_group_name" {
  value = local.resource_group_name
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.this.id
}

output "container_app_environment_default_domain" {
  value = azurerm_container_app_environment.this.default_domain
}

output "container_apps" {
  value = {
    for k, app in azurerm_container_app.this : k => {
      id                   = app.id
      name                 = app.name
      latest_revision_fqdn = app.latest_revision_fqdn
      latest_revision_name = app.latest_revision_name
      identity_principal_id = app.identity[0].principal_id
    }
  }
}