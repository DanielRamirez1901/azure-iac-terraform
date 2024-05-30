variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "location" {
  description = "Location for the Azure resources"
}

variable "public_ip_name" {
  description = "Name of the Azure Public IP"
}

variable "bastion_public_ip_name" {
  description = "Name of the Azure Public IP"
}

variable "allocation_method" {
  description = "Allocation method for the Public IP"
}

variable "sku" {
  description = "SKU for the Public IP"
}

variable "api_vnet_name" {
  description = "Name of the API Virtual Network"
}

variable "api_vnet_address_space" {
  description = "Address space for the API Virtual Network"
}

variable "api_gateway_subnet_name" {
  description = "Name of the API Gateway Subnet"
}

variable "api_gateway_subnet_address_prefixes" {
  description = "Address prefixes for the API Gateway Subnet"
}

variable "cluster_vnet_name" {
  description = "Name of the Cluster Virtual Network"
}

variable "cluster_vnet_address_space" {
  description = "Address space for the Cluster Virtual Network"
}

variable "cluster_subnet_name" {
  description = "Name of the Cluster Subnet"
}

variable "cluster_subnet_address_prefixes" {
  description = "Address prefixes for the Cluster Subnet"
}

variable "appgw_to_cluster_peering_name" {
  description = "Name of the peering from AppGW to Cluster VNet"
}

variable "cluster_to_appgw_peering_name" {
  description = "Name of the peering from Cluster to AppGW VNet"
}

variable "bastion_subnet_address_prefixes" {}

