resource_group_name = "my-prod-rg"
location = "East US"
cluster_name = "my-prod-aks"
dns_prefix = "prodaks"
node_count = 3
vm_size = "Standard_DS2_v2"
tags = {
  Environment = "Production"
  Project     = "AKS Project"
}