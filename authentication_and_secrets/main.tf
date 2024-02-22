module "azure_auth" {
  source                      = "./modules/azure_auth"
  user_assigned_identity_name = var.user_assigned_identity_name
  repository_name             = var.repository_name
  subscription_id             = var.subscription_id
  roles                       = var.roles
  federated_identity = {
    name     = var.federated_identity.name
    audience = var.federated_identity.audience
    issuer   = var.federated_identity.issuer
  }
  resource_group = {
    name     = var.resource_group_name
    location = var.location
  }

  storage_account = {
    name                     = var.storage_account.name
    account_tier             = var.storage_account.account_tier
    account_replication_type = var.storage_account.account_replication_type
    container_name           = var.storage_account.container_name
  }
  tags = var.tags
}

module "github_auth" {
  source              = "./modules/github_auth"
  repository_name     = var.repository_name
  subscription_id     = var.subscription_id
  resource_group_name = module.azure_auth.resource_group_name
  client_id           = module.azure_auth.client_id
  tenant_id           = var.tenant_id
  storage_account = {
    name           = module.azure_auth.storage_account_name
    container_name = module.azure_auth.container_name
  }
}


