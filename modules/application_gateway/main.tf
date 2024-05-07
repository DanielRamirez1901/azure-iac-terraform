# application_gateway/main.tf

resource "azurerm_application_gateway" "myApplicationGateway" {
  name                = var.application_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.public_ip_address_id
  }

  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port_port
  }

  backend_address_pool {
    name = var.backend_address_pool_name
  }

  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = var.cookie_based_affinity
    port                  = var.backend_http_settings_port
    protocol              = var.backend_http_settings_protocol
    request_timeout       = var.backend_http_settings_request_timeout
  }

  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.http_listener_frontend_ip_configuration_name
    frontend_port_name             = var.http_listener_frontend_port_name
    protocol                       = var.http_listener_protocol
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = var.request_routing_rule_rule_type
    priority                   = var.request_routing_rule_priority
    http_listener_name         = var.request_routing_rule_http_listener_name
    backend_address_pool_name  = var.request_routing_rule_backend_address_pool_name
    backend_http_settings_name = var.request_routing_rule_backend_http_settings_name
  }
}
