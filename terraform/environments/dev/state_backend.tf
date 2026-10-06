terraform {
  backend "azurerm" {
    resource_group_name  = "demo-rg_base" # Resource group of the storage account
    storage_account_name = "lincolnstorageacct693" # Your storage account name
    container_name       = "tfstate"                    # Blob container name
    key                  = "dev.terraform.tfstate"      # Name of the state file (blob)
    use_oidc             = true                         # Use OIDC for authentication
  }
}