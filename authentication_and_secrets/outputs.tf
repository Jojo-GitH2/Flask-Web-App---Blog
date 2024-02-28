# output "kube_config" {
#   value     = module.aks_cluster.kube_config
#   sensitive = true
# }

# output "tenant_id" {
#   value     = module.azure_auth.tenant_id
#   sensitive = true

# }

output "storage_account_access_key" {
  value     = module.azure_auth.storage_account_access_key
  sensitive = true

}