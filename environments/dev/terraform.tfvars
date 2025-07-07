resource_group_name = "dev-aks-rg"
location            = "eastus2"
cluster_name       = "dev-aks-cluster"
dns_prefix         = "devaks"
node_count         = 3
vm_size            = "Standard_DS2_v2"
tags               = {
  Environment = "Development"
  Project     = "AKS Project"
}