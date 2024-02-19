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
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
}


provider "github" {

  token = var.PAT_TOKEN
}