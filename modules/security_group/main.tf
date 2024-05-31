# Create Network Security Group and rule
resource "azurerm_network_security_group" "bastion-security-group" {
  name = var.name
  #provide a value for the location
  location = var.resource_group_location
  #provide a value for the resource group
  resource_group_name = var.resource_group_name

  #Provision a security rule with your current IP as a source filter
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


