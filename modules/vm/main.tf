resource "azurerm_linux_virtual_machine" "tf-linux-vm-01" {
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = var.disable_password_authentication# this must be 'true' if admin_password is not used ie., like when using admin_ssh_keys as an example
  location                        = var.resource_group_location
  name                            = var.name
  network_interface_ids = [
    var.linuxVM_nic_id
  ]
  resource_group_name = var.resource_group_name
  size                = var.size

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }
  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_vm
  }
}

# Create a NIC for LinuxVM
resource "azurerm_network_interface" "linuxVM-PrivIP-nic" {
  location            = var.resource_group_location
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  ip_configuration {
    name      = var.nic_name_ip
    subnet_id = var.nic_subnet_id
    private_ip_address_allocation = var.nic_ip_allocation
  }
}