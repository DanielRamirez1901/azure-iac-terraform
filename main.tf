provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

locals {
  backend_address_pool_name      = "${module.networking.api_vnet_name}-beap"
  frontend_port_HTTP_name        = "${module.networking.api_vnet_name}-fe_HTTP_port"
  frontend_port_HTTPS_name       = "${module.networking.api_vnet_name}-fe_HTTPS_port"
  frontend_ip_configuration_name = "${module.networking.api_vnet_name}-feip"
  http_setting_name              = "${module.networking.api_vnet_name}-be-htst"
  listener_name                  = "${module.networking.api_vnet_name}-httplstn"
  request_routing_rule_name      = "${module.networking.api_vnet_name}-rqrt"
  redirect_configuration_name    = "${module.networking.api_vnet_name}-rdrcfg"
  current_user_id                = coalesce(null, data.azurerm_client_config.current.object_id)
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "apiK8sRss"
  location            = "East US"
}

module "networking" {
  source                              = "./modules/networking"
  resource_group_name                 = module.resource_group.resource_group_name
  location                            = module.resource_group.location
  public_ip_name                      = "myTestingPublicIp"
  bastion_public_ip_name              = "bastionPublicIp"
  allocation_method                   = "Static"
  sku                                 = "Standard"
  api_vnet_name                       = "myTestingApiVnet"
  api_vnet_address_space              = ["10.1.0.0/16"]
  api_gateway_subnet_name             = "apiGatewaySubnet"
  api_gateway_subnet_address_prefixes = ["10.1.1.0/24"]
  cluster_vnet_name                   = "myTestingClusterVnet"
  cluster_vnet_address_space          = ["10.2.0.0/16"]
  cluster_subnet_name                 = "clusterSubnet"
  cluster_subnet_address_prefixes     = ["10.2.1.0/24"]
  appgw_to_cluster_peering_name       = "AppGWtoClusterVnetPeering"
  cluster_to_appgw_peering_name       = "ClustertoAppGWVnetPeering"
}

module "application_gateway" {
  source                                          = "./modules/application_gateway"
  application_gateway_name                        = "myApplicationGateway"
  resource_group_name                             = module.resource_group.resource_group_name
  location                                        = module.resource_group.location
  sku_name                                        = "Standard_v2"
  sku_tier                                        = "Standard_v2"
  sku_capacity                                    = 2
  gateway_ip_configuration_name                   = "appGatewayIpConfig"
  subnet_id                                       = module.networking.api_gateway_subnet_id
  frontend_ip_configuration_name                  = local.frontend_ip_configuration_name
  public_ip_address_id                            = module.networking.public_ip_id
  frontend_port_name                              = local.frontend_port_HTTP_name
  frontend_port_port                              = 80
  backend_address_pool_name                       = local.backend_address_pool_name
  backend_http_settings_name                      = local.http_setting_name
  cookie_based_affinity                           = "Disabled"
  backend_http_settings_port                      = 80
  backend_http_settings_protocol                  = "Http"
  backend_http_settings_request_timeout           = 60
  http_listener_name                              = local.listener_name
  http_listener_frontend_ip_configuration_name    = local.frontend_ip_configuration_name
  http_listener_frontend_port_name                = local.frontend_port_HTTP_name
  http_listener_protocol                          = "Http"
  request_routing_rule_name                       = local.request_routing_rule_name
  request_routing_rule_rule_type                  = "Basic"
  request_routing_rule_priority                   = 9
  request_routing_rule_http_listener_name         = local.listener_name
  request_routing_rule_backend_address_pool_name  = local.backend_address_pool_name
  request_routing_rule_backend_http_settings_name = local.http_setting_name
}

module "aks_cluster" {
  source                  = "./modules/aks_cluster"
  cluster_name            = "myCluster"
  resource_group_name     = module.resource_group.resource_group_name
  location                = module.resource_group.location
  dns_prefix              = "myClusterDns"
  node_pool_name          = "nodepool"
  node_count              = 1
  vm_size                 = "Standard_D2_v2"
  os_disk_size_gb         = 40
  vnet_subnet_id          = module.networking.cluster_subnet_id
  network_plugin          = "azure"
  identity_type           = "SystemAssigned"
  local_file_name         = "kubeconfig"
  secret_rotation_enabled = true
  private_cluster_enabled = true
}

module "key_vault" {
  source                      = "./modules/key_vault"
  key_vault_name              = "myKeyVault-1099"
  resource_group_name         = module.resource_group.resource_group_name
  location                    = module.resource_group.location
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7
  sku_name                    = "standard"
  object_id                   = local.current_user_id
  key_permissions             = ["Get", "Create", "List", "Delete", "Purge", "Recover", "SetRotationPolicy", "GetRotationPolicy"]
  secret_permissions          = ["Get", "Set", "List", "Delete", "Purge", "Recover"]
  certificate_permissions     = ["Get"]
  secret_names                = ["mySecret1", "mySecret2"]
  secret_values               = ["szechuan", "shashlik"]
  key_names                   = ["myKey1", "myKey2"]
  key_types                   = ["RSA", "RSA"]
  key_sizes                   = [2048, 2048]
  key_opts                    = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  time_before_expiry          = "P30D"
  expire_after                = "P90D"
  notify_before_expiry        = "P29D"
}

module "helm" {
  source                 = "./modules/helm"
  helm_name              = "aks-secret-provider"
  helm_chart             = "./aks-secret-provider"
  helm_version           = "0.0.1"
  helm_vaulname          = module.key_vault.name
  helm_tenandid          = module.key_vault.tenant_id
  helm_clientid          = module.aks_cluster.clientId
  helm_secrets           = module.key_vault.secrets
  helm_force_update      = true
  host                   = module.aks_cluster.host
  client_certificate     = module.aks_cluster.client_certificate
  client_key             = module.aks_cluster.client_key
  cluster_ca_certificate = module.aks_cluster.cluster_ca_certificate
}



module "container_registry" {
  source                  = "./modules/container_registry"
  container_name          = "containerRegistryK8SProjectExample"
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.location
  container_sku           = "Standard"
}

module "role_assignment" {
  source                           = "./modules/role_assignment"
  principal_id                     = module.aks_cluster.principal_id
  role_definition_name             = "AcrPull"
  scope                            = module.container_registry.scope
  skip_service_principal_aad_check = true
}

module "bastion_host" {
  source                  = "./modules/bastion_host"
  bastion_name            = "kratos-controller"
  resource_group_location = module.resource_group.location
  resource_group_name     = module.resource_group.resource_group_name
  ip_configuration_name   = "kratos-configuration"
  cluster_subnet_id       = module.networking.cluster_subnet_id
  bastion_public_ip       = module.networking.bastionip
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "application_gateway_name" {
  value = module.application_gateway.application_gateway_name
}

output "cluster_name" {
  value = module.aks_cluster.cluster_name
}

resource "random_password" "mysecret" {
  length = 64
}

resource "null_resource" "execute_script" {
  depends_on = [
    module.application_gateway,
    module.key_vault,
    module.aks_cluster,
    module.role_assignment,
    module.container_registry,
    module.helm,
    module.networking,
    module.resource_group

  ]
  provisioner "local-exec" {
    command = "chmod +x script.sh && ./script.sh"
  }
}


