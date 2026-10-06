locals {
  resource_group_name  = var.resource_group_name
  rg_location          = var.rg_location
  service_principal_id = "5d5a4075-3315-4cf0-830a-eeb3cf1e417e" # Replace with your actual service principal ID
  tenant_id             = "e3957433-8217-4c89-90d2-7620850e5424" # Replace with your actual tenant ID
  tags = {
    Environment = "dev"
    Project     = "lincoln_693"
  }
  container_registry_name = "lincolnregistry693"
  storage_account_name    = var.storage_account_name # must be globally
  storage_container_name  = "tfstate"
  key_vault_name          = var.key_vault_name # Replace with your actual Key Vault name
}