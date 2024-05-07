variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "location" {
  description = "Location for the Azure Key Vault"
}

variable "tenant_id" {
  description = "Tenant ID"
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention period in days"
}

variable "sku_name" {
  description = "SKU name for the Azure Key Vault"
}

variable "object_id" {
  description = "Object ID"
}

variable "key_permissions" {
  description = "Key permissions"
  type        = list(string)
}

variable "secret_permissions" {
  description = "Secret permissions"
  type        = list(string)
}

variable "certificate_permissions" {
  description = "Certificate permissions"
  type        = list(string)
}

variable "secret_names" {
  description = "Names of the Azure Key Vault secrets"
  type        = list(string)
}

variable "secret_values" {
  description = "Values of the Azure Key Vault secrets"
  type        = list(string)
}

variable "key_names" {
  description = "Names of the Azure Key Vault keys"
  type        = list(string)
}

variable "key_types" {
  description = "Types of the Azure Key Vault keys"
  type        = list(string)
}

variable "key_sizes" {
  description = "Sizes of the Azure Key Vault keys"
  type        = list(number)
}

variable "key_opts" {
  description = "Key options"
  type        = list(string)
}

variable "time_before_expiry" {
  description = "Time before expiry"
}

variable "expire_after" {
  description = "Expire after"
}

variable "notify_before_expiry" {
  description = "Notify before expiry"
}

variable "enabled_for_disk_encryption" {
  description = "Notify before expiry"
}

variable "purge_protection_enabled" {
  description = "Notify before expiry"
}
