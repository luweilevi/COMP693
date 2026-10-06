variable "name" {
  description = "Name of the storage account (must be globally unique, 3-24 lowercase alphanumeric characters)"
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

variable "account_tier" {
  description = "Account tier (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)"
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Account kind (StorageV2, BlobStorage, BlockBlobStorage, FileStorage)"
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Access tier for BlobStorage/StorageV2 (Hot or Cool)"
  type        = string
  default     = "Hot"
}

variable "enable_https_traffic_only" {
  description = "Force HTTPS only"
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "Minimum TLS version"
  type        = string
  default     = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  description = "Allow public access to blobs/containers"
  type        = bool
  default     = false
}

variable "shared_access_key_enabled" {
  description = "Enable shared access key"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
  default     = true
}

variable "network_rules" {
  description = "Network rules configuration"
  type = object({
    default_action             = optional(string, "Allow")
    bypass                     = optional(list(string), ["AzureServices"])
    ip_rules                   = optional(list(string), [])
    virtual_network_subnet_ids = optional(list(string), [])
  })
  default = null
}

variable "blob_properties" {
  description = "Blob service properties"
  type = object({
    versioning_enabled              = optional(bool, false)
    change_feed_enabled             = optional(bool, false)
    last_access_time_enabled        = optional(bool, false)
    delete_retention_days           = optional(number, 7)
    container_delete_retention_days = optional(number, 7)
  })
  default = {}
}

variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default     = {}
}

variable "service_principal_object_id" {
  description = "Object ID of the Service Principal that will receive the role"
  type        = string
}

variable "role_definition_name" {
  description = "Built-in role to assign (e.g. Storage Blob Data Contributor, Storage Blob Data Reader, etc.)"
  type        = string
  default     = "Storage Blob Data Contributor"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
}

variable "container_access_type" {
  description = "Access type for the storage container (private, blob, or container)"
  type        = string
  default     = "private"
}