# application_gateway/variables.tf

variable "application_gateway_name" {
  description = "The name of the Application Gateway."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Application Gateway."
}

variable "location" {
  description = "The location/region where the Application Gateway will be deployed."
}

variable "sku_name" {
  description = "The name of the SKU for the Application Gateway."
}

variable "sku_tier" {
  description = "The tier of the SKU for the Application Gateway."
}

variable "sku_capacity" {
  description = "The capacity (instance count) of the SKU for the Application Gateway."
}

variable "gateway_ip_configuration_name" {
  description = "The name of the gateway IP configuration."
}

variable "subnet_id" {
  description = "The ID of the subnet to which the Application Gateway should be deployed."
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration."
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the frontend IP configuration."
}

variable "frontend_port_name" {
  description = "The name of the frontend port."
}

variable "frontend_port_port" {
  description = "The port number of the frontend port."
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool."
}

variable "backend_http_settings_name" {
  description = "The name of the backend HTTP settings."
}

variable "cookie_based_affinity" {
}

variable "backend_http_settings_port" {
  description = "The port number for the backend HTTP settings."
}

variable "backend_http_settings_protocol" {
  description = "The protocol for the backend HTTP settings (e.g., 'Http' or 'Https')."
}

variable "backend_http_settings_request_timeout" {
  description = "The request timeout for the backend HTTP settings (in seconds)."
}

variable "http_listener_name" {
  description = "The name of the HTTP listener."
}

variable "http_listener_frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration associated with the HTTP listener."
}

variable "http_listener_frontend_port_name" {
  description = "The name of the frontend port associated with the HTTP listener."
}

variable "http_listener_protocol" {
  description = "The protocol for the HTTP listener (e.g., 'Http' or 'Https')."
}

variable "request_routing_rule_name" {
  description = "The name of the request routing rule."
}

variable "request_routing_rule_rule_type" {
  description = "The type of the request routing rule."
}

variable "request_routing_rule_priority" {
  description = "The priority of the request routing rule."
}

variable "request_routing_rule_http_listener_name" {
  description = "The name of the HTTP listener associated with the request routing rule."
}

variable "request_routing_rule_backend_address_pool_name" {
  description = "The name of the backend address pool associated with the request routing rule."
}

variable "request_routing_rule_backend_http_settings_name" {
  description = "The name of the backend HTTP settings associated with the request routing rule."
}
