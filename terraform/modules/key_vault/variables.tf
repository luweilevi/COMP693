variable "name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID"
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU"
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "sku_name must be either standard or premium."
  }
}

variable "secrets" {
  description = "Secrets to create in Key Vault"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags applied to the Key Vault"
  type        = map(string)
  default     = {}
}

