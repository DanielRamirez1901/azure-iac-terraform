variable "resource_group_name" {}
variable "location" {}
variable "public_ip_name" {}
variable "bastion_public_ip_name" {}
variable "allocation_method" {}
variable "sku" {}
variable "api_vnet_name" {}
variable "api_vnet_address_space" {}
variable "api_gateway_subnet_name" {}
variable "api_gateway_subnet_address_prefixes" {}
variable "cluster_vnet_name" {}
variable "cluster_vnet_address_space" {}
variable "cluster_subnet_name" {}
variable "cluster_subnet_address_prefixes" {}
variable "appgw_to_cluster_peering_name" {}
variable "cluster_to_appgw_peering_name" {}
variable "bastion_subnet_address_prefixes" {}

