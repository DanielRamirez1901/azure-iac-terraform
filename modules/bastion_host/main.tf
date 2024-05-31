resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bastion_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  copy_paste_enabled     = true
  file_copy_enabled      = true
  shareable_link_enabled = true
  tunneling_enabled      = true

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.cluster_subnet_id
    public_ip_address_id = var.bastion_public_ip
  }
}

