data "github_repository" "main" {
  full_name = var.repository_name
}

data "github_actions_public_key" "main" {
  repository = data.github_repository.main.name
}

resource "github_actions_secret" "secrets" {
  for_each = {
    # STRORAGE_ACCOUNT    = azurerm_storage_account
    # RESOURCE_GROUP      = azurerm_storage_account
    # CONTAINER_NAME      = azurerm_storage_container
    # ARM_CLIENT_ID       = azuread_service_principal
    # ARM_CLIENT_SECRET   = azuread_service_principal_password
    ARM_SUBSCRIPTION_ID = var.subscription_id
    # ARM_TENANT_ID       = data.azuread_client_config
  }

  repository      = data.github_repository.main.name
  secret_name     = each.key
  plaintext_value = each.value

}