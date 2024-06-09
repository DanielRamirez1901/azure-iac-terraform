# Define outputs for the Linux Virtual Machine and its NIC
output "linuxVM_nic_id" {
  value       = azurerm_network_interface.linuxVM-PrivIP-nic.id
  description = "The ID of the network interface for the Linux Virtual Machine."
}

output "name" {
  value       = azurerm_linux_virtual_machine.tf-linux-vm-01.name
  description = "The name of the Linux Virtual Machine."
}
