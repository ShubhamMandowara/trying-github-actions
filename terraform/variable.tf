variable "azurerm_resource_group" {
    description = "Name of resource group"
    type = string
    default = "text-process-rg"
  
}
variable "location" {
    description = "Azure region"
    type = string
    default = "eastus"
  
}
variable "acr_name" {
    description = "Name of azure container registry"
    type = string
    default = "textprocessoracr"
}
variable "cluster_name" {
    description = "Name of AKS cluster"
    type        = string
    default     = "text-processor-aks"
}