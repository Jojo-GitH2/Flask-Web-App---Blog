resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  dns_prefix          = var.aks_cluster.dns_prefix

  default_node_pool {
    name                = var.aks_cluster.default_node_pool.name
    vm_size             = var.aks_cluster.default_node_pool.vm_size
    node_count          = var.aks_cluster.default_node_pool.node_count
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }

  tags = var.tags


}
