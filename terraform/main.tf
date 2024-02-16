resource "azurerm_resource_group" "main" {
  name     = var.resource_group.name
  location = var.resource_group.location
  tags     = var.tags
}


module "aks_cluster" {
  source         = "./modules/aks"
  aks_cluster    = var.aks_cluster
  resource_group = var.resource_group
  tags           = var.tags
  depends_on     = [azurerm_resource_group.main]
}

module "k8s_deployment" {
  source     = "./modules/k8s_deployment"
  namespace  = var.namespace
  depends_on = [module.aks_cluster]
}
