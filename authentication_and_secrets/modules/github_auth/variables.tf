variable "repository_name" {
  description = "The name of the repository"
  type        = string

}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string

}

variable "resource_group_name" {
  description = "resource group name"
  type        = string

}

variable "storage_account" {
  description = "The storage account properties"
  type        = map(string)

}

variable "client_id" {
  description = "The client ID of the user assigned identity"
  type        = string

}

variable "tenant_id" {
  description = "The tenant ID of the user assigned identity"
  type        = string
}