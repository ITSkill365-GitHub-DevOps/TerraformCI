
terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"

    }
  }
  cloud {
    organization = "itskill365"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "809-027575a7-deploy-to-azure-using-the-terraform-c"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "hj6t7567yt56td56765"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
