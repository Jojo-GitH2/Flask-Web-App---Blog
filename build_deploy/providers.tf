terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.92.0"
    }
    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = "2.26.0"
    # }
    github = {
      source  = "integrations/github"
      version = "6.0.0"
    }

  }
  # backend "azurerm" {
  #   key = "terraform.tfstate"
  # }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
}

# provider "kubernetes" {
#   # Configuration options
#   host                   = module.aks_cluster.kube_config.host
#   username               = module.aks_cluster.kube_config.username
#   password               = module.aks_cluster.kube_config.password
#   client_certificate     = base64decode(module.aks_cluster.kube_config.client_certificate)
#   client_key             = base64decode(module.aks_cluster.kube_config.client_key)
#   cluster_ca_certificate = base64decode(module.aks_cluster.kube_config.cluster_ca_certificate)


# }

provider "github" {

  token = var.PAT_TOKEN
}