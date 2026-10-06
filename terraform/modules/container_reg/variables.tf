variable "name" {
  description = "Name of the Azure Container Registry (must be globally unique, alphanumeric only)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East Asia"
}

variable "sku" {
  description = "SKU of the container registry (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "SKU must be Basic, Standard, or Premium."
  }
}

variable "admin_enabled" {
  description = "Enable admin user"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed"
  type        = bool
  default     = false
}

variable "georeplications" {
  description = "List of geo-replication locations (Premium SKU only)"
  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool, false)
    tags                    = optional(map(string), {})
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the registry"
  type        = map(string)
  default     = {}
}

variable "principal_id" {
  description = "The principal ID of the user or service principal to assign the role to"
  type        = string
}

variable "role_definition_name" {
  description = "Built-in role to assign (e.g. Storage Blob Data Contributor, Storage Blob Data Reader, etc.)"
  type        = string
  default     = "Container Registry Repository Writer"
}