output "kube_admin_config" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "resource_group_name" {
  value = azurerm_kubernetes_cluster.aks.resource_group_name
}