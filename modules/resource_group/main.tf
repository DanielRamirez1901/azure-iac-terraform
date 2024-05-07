resource "azurerm_resource_group" "apiK8sRss" {
  name     = var.resource_group_name
  location = var.location
}