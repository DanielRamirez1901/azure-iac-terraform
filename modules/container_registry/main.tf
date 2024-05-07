resource "azurerm_container_registry" "acrk8s" {
  name                = var.container_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.container_sku
}