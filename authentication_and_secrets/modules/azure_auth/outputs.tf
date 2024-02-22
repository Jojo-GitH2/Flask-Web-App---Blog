output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "The name of the resource group"

}

output "location" {
  value       = azurerm_resource_group.main.location
  description = "The location of the resource group"
}

output "tags" {
  value       = azurerm_resource_group.main.tags
  description = "The tags of the resource group"

}

output "container_name" {
  value       = azurerm_storage_container.main.name
  description = "The name of the storage container"

}

output "storage_account_name" {
  value       = azurerm_storage_account.main.name
  description = "The name of the storage account"

}

output "storage_account_access_key" {
  value       = azurerm_storage_account.main.primary_access_key
  description = "The primary access key of the storage account"
  sensitive   = true
}

output "client_id" {
  value       = azurerm_user_assigned_identity.main.client_id
  description = "The client ID of the user assigned identity"
  sensitive   = true
}

output "tenant_id" {
  value       = azurerm_user_assigned_identity.main.tenant_id
  description = "The tenant ID of the user assigned identity"
  sensitive   = true
}