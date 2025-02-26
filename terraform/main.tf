terraform{
    required_providers {
      azurerm ={
        source = "hashicorp/azurerm"
        version = "~> 3.0"
      }
    }
}
provider "azurerm" {
    features {
      
    }
  
}
resource "azurerm_resource_group" "rg" {
    name = var.azurerm_resource_group
    location = var.location
  
}

resource "azurerm_container_registry" "acr" {
    name = var.acr_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    sku = "Standard"
    admin_enabled = true
}
resource "azurerm_kubernetes_cluster" "aks" {
    name = var.cluster_name
    location =  azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix = var.cluster_name

    default_node_pool {
      name = "default"
      node_count = 1
      vm_size = "Standard_D2_V2"
    }
    identity {
      type = "SystemAssigned"
    }
}
