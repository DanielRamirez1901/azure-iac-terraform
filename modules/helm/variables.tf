variable "helm_name" {
  description = "Name of the Helm release"
}

variable "helm_chart" {
  description = "Chart to install"
}

variable "helm_version" {
  description = "Version of the chart"
}

variable "helm_vaulname" {
  description = "Vault name"
}

variable "helm_tenandid" {
  description = "Tenant ID"
}

variable "helm_clientid" {
  description = "Client ID"
}

variable "helm_secrets" {
  description = "List of secrets"
}

variable "host" {
  description = "Kubernetes host"
}

variable "client_certificate" {
  description = "Base64 encoded client certificate"
}

variable "client_key" {
  description = "Base64 encoded client key"
}

variable "cluster_ca_certificate" {
  description = "Base64 encoded cluster CA certificate"
}

variable "helm_force_update" {
  description = "force update"
}

