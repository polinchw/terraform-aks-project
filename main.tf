module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location           = var.location
  cluster_name       = var.cluster_name
  dns_prefix         = var.dns_prefix
  node_count         = var.node_count
  vm_size            = var.vm_size
  tags               = var.tags
  user_pool_temp_name = var.user_pool_temp_name
  max_pods          = var.max_pods
}