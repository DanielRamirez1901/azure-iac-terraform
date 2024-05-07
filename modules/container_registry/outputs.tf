output "scope" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_container_registry.acrk8s.id
}
