resource_group_name = "dev-aks-rg"
location            = "eastus2"
cluster_name       = "dev-aks-cluster"
dns_prefix         = "devaks"
node_count         = 1
vm_size            = "Standard_DS3_v2"
tags               = {
  Environment = "Development"
  Project     = "AKS Project"
}
# Add a variable for the temporary name used during node pool rotation
user_pool_temp_name = "userpooltemp"
max_pods          = 110