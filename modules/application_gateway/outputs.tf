# application_gateway/outputs.tf

output "application_gateway_id" {
  description = "The ID of the created Azure Application Gateway."
  value       = azurerm_application_gateway.myApplicationGateway.id
}

output "application_gateway_name" {
  description = "The ID of the created Azure Application Gateway."
  value       = azurerm_application_gateway.myApplicationGateway.name
}

