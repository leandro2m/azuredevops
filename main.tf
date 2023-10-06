provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "lmomessoDevops"
    storage_account_name  = "lmomessostates"
    container_name        = "tstate"
    key                   = "terraform.tfstate"

  }

}


resource "azurerm_resource_group" "lmomessoDevops" {
  name     = "lmomessoTFDevops"
  location = "East US"
}

resource "azurerm_virtual_network" "lmomessoDevops" {
  name                = "lmomesso-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.lmomessoDevops.location
  resource_group_name = azurerm_resource_group.lmomessoDevops.name
}