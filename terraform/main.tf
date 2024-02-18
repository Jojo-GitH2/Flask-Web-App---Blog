# data "azurerm_resource_group" "main" {
#   name = var.resource_group_name
# }

module "azure_auth" {
  source                      = "./modules/azure_auth"
  user_assigned_identity_name = var.user_assigned_identity_name
  repository_name             = var.repository_name
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
  tenant_id           = module.azure_auth.tenant_id
  storage_account = {
    name           = module.azure_auth.storage_account_name
    container_name = module.azure_auth.container_name
  }
}

# module "aks_cluster" {
#   source              = "./modules/aks"
#   aks_cluster         = var.aks_cluster
#   resource_group_name = data.azurerm_resource_group.main.name
#   tags                = data.azurerm_resource_group.main.tags
#   location            = data.azurerm_resource_group.main.location
# }

# module "k8s_deployment" {
#   source         = "./modules/k8s_deployment"
#   namespace      = var.namespace
#   docker_image   = var.docker_image
#   k8s_deployment = var.k8s_deployment
#   depends_on     = [module.aks_cluster]
# }
