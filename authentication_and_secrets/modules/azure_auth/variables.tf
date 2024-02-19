variable "resource_group" {
  description = "The resource group properties"
  type = object({
    name     = string
    location = string
  })
}

variable "tags" {
  description = "tags to be applied to all resources"
  type        = map(string)

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

variable "repository_name" {
  description = "The name of the repository"
  type        = string

}

variable "federated_identity" {
  description = "The federated identity properties"
  type = object({
    name     = string
    audience = string
    issuer   = string
  })

}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string

}

variable "roles" {
  description = "The roles to be assigned to the user assigned identity"
  type        = list(string)

}