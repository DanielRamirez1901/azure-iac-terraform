# modules/identity/variables.tf
variable "name" {
  description = "The name of the user-assigned identity."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the identity should be created."
  type        = string
}
/*
variable "credential_aks_name" {}
variable "issuer" {}
variable "subject" {}
variable "audience" {
  description = "The audience for the federated identity credential."
  type        = list(string)
  default     = ["api://AzureADTokenExchange"]
}
*/