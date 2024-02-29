data "azurerm_resource_group" "auth" {
  name = var.auth.resource_group_name
}

data "azurerm_storage_account" "auth" {
  name                = var.auth.storage_account.name
  resource_group_name = data.azurerm_resource_group.auth.name

}

# data "terraform_remote_state" "auth_secrets" {
#   backend = "azurerm"
#   config = {
#     storage_account_name = var.auth.storage_account.name
#     container_name       = "auth"
#     key                  = "terraform.tfstate"
#     access_key = data.azurerm_storage_account.auth.primary_access_key
#   }
# }

module "aks_cluster" {
  source              = "./modules/aks"
  aks_cluster         = var.aks_cluster
  resource_group_name = var.resource_group_name
  tags                = var.tags
  location            = var.location
}

module "k8s_deployment" {
  source         = "./modules/k8s_deployment"
  namespace      = var.namespace
  docker_image   = var.docker_image
  k8s_deployment = var.k8s_deployment
  depends_on     = [module.aks_cluster]
}
