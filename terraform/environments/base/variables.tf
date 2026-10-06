variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "demo-rg_base"
}

variable "rg_location" {
  description = "The location of the resource group"
  type        = string
  default     = "East Asia"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "lincolnstorageacct693"
}

variable "key_vault_name" {
  description = "The name of the key vault"
  type        = string
  default     = "lincolnkeyvault693"
}