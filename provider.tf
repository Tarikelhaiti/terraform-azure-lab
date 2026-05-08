terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }

    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "docker" {
  host = "tcp://${module.create_vm.public_ip}:2375"
}
