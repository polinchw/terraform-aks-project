variable "resource_group_name" {
  description = "The name of the resource group for the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machines in the AKS cluster."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "subscription_id" {
  description = "The Azure subscription ID where the resources will be created."
  type        = string
  
}
  
variable "user_pool_temp_name" {
  description = "The temporary name used during node pool rotation."
  type        = string
}

variable "max_pods" {
  description = "The maximum number of pods per node."
  type        = number
}