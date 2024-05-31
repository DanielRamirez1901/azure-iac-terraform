

output "name" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_network_security_group.bastion-security-group.name
}

output "id" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_network_security_group.bastion-security-group.id
}



