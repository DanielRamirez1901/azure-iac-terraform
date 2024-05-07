# network/main.tf


# Ip Publica para asociarla al Api Gateway
resource "azurerm_public_ip" "publicIp" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_public_ip" "bastionpublicIp" {
  name                = var.bastion_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

# Virtual Network sobre lo que estara asociado el Api Gateway
resource "azurerm_virtual_network" "apiVnet" {
  name                = var.api_vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.api_vnet_address_space
}
# Subred en la que estara el Api Gateway
resource "azurerm_subnet" "apiGatewaySubnet" {
  name                 = var.api_gateway_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.apiVnet.name
  address_prefixes     = var.api_gateway_subnet_address_prefixes
}
# Virtual Network sobre lo que estara asociado el Cluster
resource "azurerm_virtual_network" "clusterVnet" {
  name                = var.cluster_vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.cluster_vnet_address_space
}
# Subred en la que estara el Cluster
resource "azurerm_subnet" "clusterSubnet" {
  name                 = var.cluster_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.clusterVnet.name
  address_prefixes     = var.cluster_subnet_address_prefixes
}

resource "azurerm_virtual_network_peering" "AppGWtoClusterVnetPeering" {
  name                         = var.appgw_to_cluster_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.apiVnet.name
  remote_virtual_network_id    = azurerm_virtual_network.clusterVnet.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "ClustertoAppGWVnetPeering" {
  name                         = var.cluster_to_appgw_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.clusterVnet.name
  remote_virtual_network_id    = azurerm_virtual_network.apiVnet.id
  allow_virtual_network_access = true
}