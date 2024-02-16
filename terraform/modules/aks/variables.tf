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

variable "resource_group" {
  description = "resource group properties"
  type        = map(string)

}

variable "tags" {
  description = "tags to be applied to all resources"
  type        = map(string)

}