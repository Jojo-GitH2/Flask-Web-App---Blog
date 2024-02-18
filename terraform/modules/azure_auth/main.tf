resource "azurerm_resource_group" "main" {
  name     = var.resource_group.name
  location = var.resource_group.location
  tags     = var.tags

}

resource "azurerm_storage_account" "main" {
  name                     = var.storage_account.name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type
  tags                     = var.tags
}

resource "azurerm_storage_container" "main" {
  name                  = var.storage_account.container_name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "container"
}
