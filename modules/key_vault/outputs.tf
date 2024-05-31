output "key_vault_id" {
  description = "The ID of the created Azure Key Vault."
  value       = azurerm_key_vault.key_vault.id
}

output "name" {
  description = "The ID of the created Azure Key Vault."
  value       = azurerm_key_vault.key_vault.name
}

output "tenant_id" {
  description = "The ID of the created Azure Key Vault."
  value       = azurerm_key_vault.key_vault.tenant_id
}


output "secrets" {
  description = "The ID of the created Azure Key Vault."
  value       = azurerm_key_vault_secret.key_vault_secret[*].value
}


output "linuxVM_pswd" {
  value     = azurerm_key_vault_secret.linuxVM-pswd.value
  sensitive = true
}

/*
output "ssh_public_key" {
  value     = azurerm_key_vault_secret.ssh_public_key.value
  sensitive = true
}
*/


