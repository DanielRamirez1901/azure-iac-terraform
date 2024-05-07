# resource_group/outputs.tf

output "resource_group_id" {
  description = "The ID of the created Azure Resource Group."
  value       = azurerm_resource_group.apiK8sRss.id
}

# En el archivo outputs.tf del módulo resource_group

output "resource_group_name" {
  value = azurerm_resource_group.apiK8sRss.name
}

# En el archivo outputs.tf del módulo resource_group

output "location" {
  value = azurerm_resource_group.apiK8sRss.location
}

