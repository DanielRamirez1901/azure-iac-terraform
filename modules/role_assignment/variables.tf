variable "principal_id" {
  description = "The ID of the principal to assign the role to."
}

variable "role_definition_name" {
  description = "The name of the role definition to assign."
}

variable "scope" {
  description = "The scope at which the role assignment will be applied."
}

variable "skip_service_principal_aad_check" {
  description = "Whether to skip the AAD check for the service principal."
}
