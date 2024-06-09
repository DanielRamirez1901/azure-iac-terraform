output "key_vault_id" { value = azurerm_key_vault.key_vault.id }
output "name" { value = azurerm_key_vault.key_vault.name }
output "tenant_id" { value = azurerm_key_vault.key_vault.tenant_id }
output "secrets" { value = azurerm_key_vault_secret.key_vault_secret[*].value }
output "linuxVM_pswd" {
  value     = azurerm_key_vault_secret.linuxVM-pswd.value
  sensitive = true
}
