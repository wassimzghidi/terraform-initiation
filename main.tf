terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.43.0"
    }
  } 
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "test-wzg-automation"
  location = "francecentral"
}

resource "azurerm_storage_account" "storage-tf" {
  name = "storagetftestwzgauto"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}