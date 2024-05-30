output "aks_cluster_id" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "cluster_name" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "clientId" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.key_vault_secrets_provider[0].secret_identity[0].client_id
}

output "host" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].host
}

output "client_certificate" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_certificate
}

output "client_key" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_key
}

output "cluster_ca_certificate" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].cluster_ca_certificate
}

output "principal_id" {
  description = "The ID of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
}
/*
output "issuer" {
  value = azurerm_kubernetes_cluster.aks_cluster.oidc_issuer_url
}
*/

output "secret_provider" {
  description = "The ID of the created AKS cluster."
  value       =  azurerm_kubernetes_cluster.aks_cluster.key_vault_secrets_provider[0].secret_identity[0].object_id
}
