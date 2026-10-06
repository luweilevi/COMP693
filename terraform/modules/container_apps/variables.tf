variable "name_prefix" {
  description = "Prefix used for all resource names"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East Asia"
}

variable "resource_group_name" {
  description = "Existing Resource Group name. Leave empty to create a new one."
  type        = string
  default     = null
}

variable "create_resource_group" {
  description = "Whether to create a new Resource Group"
  type        = bool
  default     = true
}

variable "log_analytics_retention_days" {
  description = "Log Analytics retention in days"
  type        = number
  default     = 30
}

variable "container_apps" {
  description = "Map of Container Apps to create"
  type = map(object({
    container_registry_server = optional(string, null)
    identity_type = optional(string, null) # "System" or "UserAssigned"
    user_assigned_identity_id = optional(string, null)
    revision_mode = optional(string, "Single")
    min_replicas  = optional(number, 0)
    max_replicas  = optional(number, 10)

    containers = list(object({
      name   = string
      image  = string
      cpu    = number
      memory = string
      env = optional(list(object({
        name        = string
        value       = optional(string)
        secret_name = optional(string)
      })), [])
    }))

    ingress = optional(object({
      external_enabled           = optional(bool, true)
      target_port                = number
      transport                  = optional(string, "http")
      allow_insecure_connections = optional(bool, false)
    }))

    secrets = optional(list(object({
      name  = string
      value = optional(string)
      azurerm_key_vault_secret_id = optional(string)
      identity            = optional(string, "System")
    })), [])

    tags = optional(map(string), {})
  }))
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}