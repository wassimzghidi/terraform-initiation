terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.43.0"        
    }
  }
  cloud { 
    organization = "initiation-wzg" 
    workspaces { 
      name = "Terraform-Initiation-CLIdriven" 
    } 
  }   
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg2" {
    name = "test-wzg-automation"
    location = "France Central" 
}

resource "azurerm_storage_account" "storageaccount" {
  name = "storagetftestwzauto3"
  resource_group_name = azurerm_resource_group.rg2.name
  location = azurerm_resource_group.rg2.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  
}