resource "azurerm_role_assignment" "arak8s" {
  principal_id                     = var.principal_id
  role_definition_name             = var.role_definition_name
  scope                            = var.scope
  skip_service_principal_aad_check = var.skip_service_principal_aad_check
}

resource "azurerm_role_assignment" "key_vault_access" {
  scope                = var.scope_key_vault
  role_definition_name = var.role_definition_name_key_vault
  principal_id         = var.principal_id_key_vault
}