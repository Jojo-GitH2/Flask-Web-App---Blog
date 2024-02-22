module "aks_cluster" {
  source              = "./modules/aks"
  aks_cluster         = var.aks_cluster
  resource_group_name = var.resource_group_name
  tags                = var.tags
  location            = var.location
}

# module "k8s_deployment" {
#   source         = "./modules/k8s_deployment"
#   namespace      = var.namespace
#   docker_image   = var.docker_image
#   k8s_deployment = var.k8s_deployment
#   depends_on     = [module.aks_cluster]
# }
