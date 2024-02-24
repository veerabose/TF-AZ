terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {
    organization = "CK-Terraform"
    workspaces {
      name = "remote-state"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "veera-terraform-demo"
  location = "eastus"
}

module "securestorage" {
  source               = "app.terraform.io/CK-Terraform/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "veeraaristrg37"

}
