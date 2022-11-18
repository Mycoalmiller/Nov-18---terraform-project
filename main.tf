# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tf"{
    name = "tf-resources"
    location = "East US 2"
    tags = {
        environment = "Dev"
        source = "Terraform"
        owner = "Michael"
    }
}

resource "azurerm_virtual_network" "tf" {
  name                = "tf-network"
  address_space       = ["10.0.0.0/16"]
  location            = "East US 2"
  resource_group_name = "tf-resources"
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

    subnet {
        name           = "subnet1"
        address_prefix = "10.0.1.0/24"
  }


     subnet {
       name           = "subnet2"
       address_prefix = "10.0.2.0/24"
  }
  tags = {
    source = "Terraform"
    environment = "Production"
    name = "Michael"
  }

}


