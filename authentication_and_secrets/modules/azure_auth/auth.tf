resource "azurerm_user_assigned_identity" "main" {
  name                = var.user_assigned_identity_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

}

resource "azurerm_federated_identity_credential" "main" {
  name                = var.federated_identity.name
  resource_group_name = azurerm_resource_group.main.name
  audience            = [var.federated_identity.audience]
  issuer              = var.federated_identity.issuer
  parent_id           = azurerm_user_assigned_identity.main.id
  subject             = "repo:${var.repository_name}:ref:refs/heads/main"
}

resource "azurerm_role_assignment" "main" {
  count                = length(var.roles)
  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = var.roles[count.index]
  principal_id         = azurerm_user_assigned_identity.main.principal_id
  depends_on = [ azurerm_federated_identity_credential.main ]

}

