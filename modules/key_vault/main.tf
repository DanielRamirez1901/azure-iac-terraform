resource "random_password" "rndm-pswd" {
  length           = 18
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 4
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  sku_name                    = var.sku_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  purge_protection_enabled    = var.purge_protection_enabled

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
    certificate_permissions = var.certificate_permissions
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.user_assigned_identity_principal_id

    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
    certificate_permissions = var.certificate_permissions
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.aks_secret_provider_id

    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
    certificate_permissions = var.certificate_permissions
  }
}

resource "azurerm_key_vault_secret" "key_vault_secret" {
  count        = length(var.secret_names)
  name         = var.secret_names[count.index]
  value        = var.secret_values[count.index]
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "linuxVM-pswd" {
  name         = "linuxVM-pswd"
  value        = random_password.rndm-pswd.result
  key_vault_id = azurerm_key_vault.key_vault.id
}
