# data "azurerm_resource_group" "main" {
#   name = var.resource_group_name
# }

module "github_auth" {
  source          = "./modules/github_auth"
  repository_name = var.repository_name
  subscription_id = var.subscription_id

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
