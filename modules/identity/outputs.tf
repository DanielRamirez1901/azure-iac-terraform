
output "client_id" {
  value = azurerm_user_assigned_identity.myIdentity.client_id
}

output "principal_id" {
  value = azurerm_user_assigned_identity.myIdentity.principal_id
}

output "id" {
  value = azurerm_user_assigned_identity.myIdentity.id
}
