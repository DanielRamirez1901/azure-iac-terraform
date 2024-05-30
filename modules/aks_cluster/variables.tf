variable "cluster_name" {
  description = "Name of the AKS cluster"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
}

variable "location" {
  description = "Location for the AKS cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
}

variable "node_pool_name" {
  description = "Name of the default node pool"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
}

variable "vm_size" {
  description = "Size of VMs in the default node pool"
}

variable "os_disk_size_gb" {
  description = "Size of the OS disk in GB for nodes in the default node pool"
}

variable "vnet_subnet_id" {
  description = "ID of the subnet where the AKS cluster will be deployed"
}

variable "network_plugin" {
  description = "Network plugin to use for the AKS cluster"
}

variable "identity_type" {
  description = "Type of identity for the AKS cluster"
}

variable "local_file_name" {
  description = "Name of the kuberneter file"
}

variable "secret_rotation_enabled" {
  description = "Name of the kuberneter file"
}

/*
variable "aks_secret_provider_id" {}
variable "name_workload_identity" {}
variable "namespace" {}
variable "user_assigned_client_id" {}
*/


/*
variable "private_cluster_enabled" {
  description = "Name of the kuberneter file"
}
*/