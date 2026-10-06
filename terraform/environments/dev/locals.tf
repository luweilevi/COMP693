locals {
  resource_group_name  = "demo-rg_dev"
  resource_group_name_base = "demo-rg_base"
  rg_location          = "East Asia"
  service_principal_id = "5d5a4075-3315-4cf0-830a-eeb3cf1e417e" # Replace with your actual service principal ID
  tags = {
    Environment = "dev"
    Project     = "lincoln_693"
  }
  container_registry_name = "lincolnregistry693"
  storage_account_name    = "lincolnstorageacct693" # must be globally
  storage_container_name  = "tfstate"
  key_vault_name          = "lincolnkeyvault693" # Replace with your actual Key Vault name
}