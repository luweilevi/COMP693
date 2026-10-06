variable "name_prefix" {
  description = "Prefix used for all resource names"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "Map of subnet names to CIDR blocks"
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {
    default = {
      address_prefixes = ["10.0.1.0/24"]
    }
  }
}

variable "private_dns_zone_name" {
  description = "Name of the Private DNS Zone (e.g. privatelink.blob.core.windows.net)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "enable_vnet_link" {
  description = "Whether to create a VNet link for the Private DNS Zone"
  type        = bool
  default     = false
}

variable "registration_enabled" {
  description = "Enable auto-registration of VM records in the Private DNS Zone"
  type        = bool
  default     = false
}