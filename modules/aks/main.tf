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
    network_plugin_mode = "overlay"
  }

  tags = var.tags
}

data "azurerm_role_definition" "disk_snapshot_contributor" {
  name  = "Disk Snapshot Contributor"
  scope = azurerm_resource_group.aks_rg.id
}

resource "azurerm_role_assignment" "aks_disk_snapshot_contributor" {
  scope              = azurerm_resource_group.aks_rg.id
  role_definition_id = data.azurerm_role_definition.disk_snapshot_contributor.id
  principal_id       = azurerm_kubernetes_cluster.aks.identity[0].principal_id

  # Ensures the cluster exists before we try to read its node RG
  depends_on = [azurerm_kubernetes_cluster.aks]
}

resource "azurerm_kubernetes_cluster_node_pool" "user_pool" {
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
  max_pods              = var.max_pods
  os_type               = "Linux"
  mode                  = "User"
  node_taints           = ["special=true:NoSchedule"]
  temporary_name_for_rotation = var.user_pool_temp_name
  zones                 = ["1", "2", "3"]
}