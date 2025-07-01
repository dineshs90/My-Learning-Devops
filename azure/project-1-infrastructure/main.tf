terraform {
    required_providers{
        azurerm = {

            source = "hashicorp/azurerm"
            version = "~>3.0"
        }

    }
}

provider "azurerm"{
    features {}

}

resource "azurerm_resource_group" "main" {
    name = var.resource_group_name
    location = var.location
}

resource "azurerm_container_group" "webapp" {

    name = "web-container"
    resource_group_name = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
    os_type = "Linux"
    ip_address_type = "Public" 

    container{

        name = "web-container-app"
        cpu = "0.5"
        memory = "1.5"
        image = "mcr.microsoft.com/oss/nginx/nginx:1.15.5-alpine"

        ports {
            port = "80"
            protocol = "TCP"
        }
    }
}