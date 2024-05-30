# modules/identity/main.tf
resource "azurerm_user_assigned_identity" "myIdentity" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
}
/*
resource "azurerm_federated_identity_credential" "aksfederatedidentity" {
  parent_id           = azurerm_user_assigned_identity.myIdentity.id
  name                = var.credential_aks_name
  resource_group_name = var.resource_group_name
  audience            = var.audience
  issuer              = var.issuer
  subject             = var.subject
}
*/