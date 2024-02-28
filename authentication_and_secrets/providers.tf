terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.92.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.0.0"
    }

  }
  backend "azurerm" {
    key                  = "terraform.tfstate"
    storage_account_name = "stateauth"
    access_key           = "m13VEtcSg0y/KKQmvzJnGnwViejgljBPEG6a6atwBkVqGWoUbrirA/K3r0zONkwxBckyNQwG5723+AStkWfKqw=="
    container_name       = "auth"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}


provider "github" {

  token = var.PAT_TOKEN
}
