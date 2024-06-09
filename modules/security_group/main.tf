resource "azurerm_network_security_group" "bastion-security-group" {
  name                = var.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = var.security_name
    priority                   = var.security_priority
    direction                  = var.security_direction
    access                     = var.security_access
    protocol                   = var.security_protocol
    source_port_range          = var.security_source_port_range
    destination_port_range     = var.security_destination_port_range
    source_address_prefix      = var.security_source_address_prefix
    destination_address_prefix = var.security_destination_address_prefix
  }
}


