variable "name" {
  description = "Name of the PostgreSQL Flexible Server (must be globally unique)"
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

variable "postgresql_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "16"
}

variable "sku_name" {
  description = "SKU name"
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
  default     = 32768
}

variable "administrator_login" {
  description = "Administrator login"
  type        = string
  default     = "psqladmin"
}

variable "administrator_password" {
  description = "Administrator password (null = auto-generate)"
  type        = string
  default     = null
  sensitive   = true
}


variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "geo_redundant_backup_enabled" {
  type    = bool
  default = false
}

variable "zone" {
  type    = string
  default = "1"
}

# ---------- Networking ----------
variable "public_network_access_enabled" {
  description = "Set to false for private access"
  type        = bool
  default     = false
}

variable "delegated_subnet_id" {
  description = "ID of the delegated subnet (required for private access)"
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "ID of the Private DNS Zone (required for private access)"
  type        = string
  default     = null
}

variable "firewall_rules" {
  description = "Firewall rules (only used when public access is enabled)"
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {}
}

variable "databases" {
  description = "Map of databases to create"
  type = map(object({
    charset   = optional(string, "UTF8")
    collation = optional(string, "en_US.utf8")
  }))
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}