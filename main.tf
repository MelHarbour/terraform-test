provider "azurerm" {
  version = "2.23"
  features {}
}

resource "azurerm_resource_group" "rg" {
    name = "mrh-test-resource-group"
    location = "North Europe"
}

resource "azurerm_app_service" "app" {
  name                    = "mrh-test-service"
  location                = "North Europe"
  resource_group_name     = azurerm_resource_group.rg.name

  lifecycle {
    ignore_changes = [
      source_control
    ]
  }
}