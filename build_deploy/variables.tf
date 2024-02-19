variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "aks_cluster" {
  description = "AKS cluster properties"
  type = object({
    name       = string
    dns_prefix = string
    default_node_pool = object({
      name       = string
      vm_size    = string
      node_count = number
    })
  })

}

variable "namespace" {
  description = "namespace to deploy the application"
  type        = string

}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string

}

variable "k8s_deployment" {
  description = "Kubernetes deployment properties"
  type = object({
    metadata = object({
      name = string
    })
    app = string
  })

}

variable "repository_name" {
  description = "The name of the repository"
  type        = string

}

variable "PAT_TOKEN" {
  description = "The Personal Access Token for GitHub"
  type        = string

}

variable "tags" {
  description = "tags to be applied to all resources"
  type        = map(string)

}

variable "location" {
  description = "location of the resource group"
  type        = string

}

variable "storage_account" {
  description = "The storage account properties"
  type        = map(string)

}

variable "user_assigned_identity_name" {
  description = "The name of the user assigned identity"
  type        = string
  sensitive   = true

}

variable "federated_identity" {
  description = "The federated identity properties"
  type = object({
    name     = string
    audience = string
    issuer   = string
  })

}

variable "roles" {
  description = "The roles to be assigned to the user assigned identity"
  type        = list(string)

}

