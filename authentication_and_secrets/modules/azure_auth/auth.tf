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

data "azurerm_role_definition" "this" {
  for_each = toset(var.roles)
  name     = each.value
}

resource "azurerm_role_assignment" "main" {
  for_each             = data.azurerm_role_definition.this
  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = each.value.name
  principal_id         = azurerm_user_assigned_identity.main.principal_id
  depends_on           = [azurerm_federated_identity_credential.main]

}

