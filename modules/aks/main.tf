resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "agentpool"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }


  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "user_pool" {
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
  max_pods              = 110
  os_type               = "Linux"
  mode                  = "User"
  node_taints           = ["special=true:NoSchedule"]
  temporary_name_for_rotation = var.user_pool_temp_name
}