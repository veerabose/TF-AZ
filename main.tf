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