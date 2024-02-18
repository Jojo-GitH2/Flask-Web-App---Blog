resource "azurerm_user_assigned_identity" "main" {
  name                = var.user_assigned_identity_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

}

resource "azurerm_federated_identity_credential" "main" {
  name                = var.federated_identity.name
  resource_group_name = var.resource_group.name
  audience            = [var.federated_identity.audience]
  issuer              = var.federated_identity.issuer
  parent_id           = azurerm_user_assigned_identity.main.id
  subject             = "repo:${var.repository_name}:ref:refs/heads/main"


}
