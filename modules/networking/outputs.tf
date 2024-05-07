output "public_ip_id" {
  description = "The ID of the created Azure Public IP."
  value       = azurerm_public_ip.publicIp.id
}

output "bastionip" {
  description = "The ID of the created Azure Public IP."
  value       = azurerm_public_ip.bastionpublicIp.id
}

output "api_vnet_name" {
  description = "The ID of the created API Virtual Network."
  value       = azurerm_virtual_network.apiVnet.name
}

output "api_vnet_id" {
  description = "The ID of the created API Virtual Network."
  value       = azurerm_virtual_network.apiVnet.id
}

output "api_gateway_subnet_id" {
  description = "The ID of the API Gateway Subnet."
  value       = azurerm_subnet.apiGatewaySubnet.id
}

output "cluster_vnet_id" {
  description = "The ID of the created Cluster Virtual Network."
  value       = azurerm_virtual_network.clusterVnet.id
}

output "cluster_subnet_id" {
  description = "The ID of the Cluster Subnet."
  value       = azurerm_subnet.clusterSubnet.id
}