output "id" {
  description = "ID of the Key Vault"
  value       = azurerm_key_vault.this.id
}

output "name" {
  description = "Name of the Key Vault"
  value       = azurerm_key_vault.this.name
}

output "vault_uri" {
  description = "URI of the Key Vault"
  value       = azurerm_key_vault.this.vault_uri
}

output "secret_ids" {
  description = "IDs of the Key Vault secrets"
  value = {
    for name, secret in azurerm_key_vault_secret.this :
    name => secret.id
  }
}