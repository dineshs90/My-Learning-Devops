output "resource_group_name" {
    description = "resource group name"
    value = azurerm_resource_group.main.name
}

output "location" {
    description = "Azure resource location "
    value = azurerm_resource_group.main.location
}

output "webapp-url" {
    description = " web app url"
    value = "http://${azurerm_container_group.webapp.ip_address}"
}

output "webapp-ip" {
    description = "web app ip"
    value = azurerm_container_group.webapp.ip_address
}