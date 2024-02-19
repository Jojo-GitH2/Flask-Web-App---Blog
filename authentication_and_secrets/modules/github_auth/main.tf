data "github_repository" "main" {
  full_name = var.repository_name
}

resource "github_actions_variable" "secrets" {
  for_each = {
    AZURE_STORAGE_ACCOUNT = var.storage_account.name
    AZURE_RESOURCE_GROUP   = var.resource_group_name
    STORAGE_CONTAINER_NAME = var.storage_account.container_name
    ARM_CLIENT_ID          = var.client_id
    ARM_SUBSCRIPTION_ID    = var.subscription_id
    ARM_TENANT_ID          = var.tenant_id
  }

  repository      = data.github_repository.main.name
  variable_name = each.key
  value = each.value

}