output "kube_config" {
  value = { host = azurerm_kubernetes_cluster.aks.kube_config.0.host
    client_certificate     = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
    client_key             = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
    cluster_ca_certificate = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
    username               = azurerm_kubernetes_cluster.aks.kube_config.0.username
    password               = azurerm_kubernetes_cluster.aks.kube_config.0.password
  }
  description = "Kube config for connecting to the AKS cluster"
}