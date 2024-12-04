provider "azurerm" {
  features {}
}

variable "name" {
  description = "The name of the resources"
  type        = string
}

variable "ade_location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}


resource "azurerm_app_service_plan" "example" {
    name                = "${var.name}-asp"
    location            = ade_location
    resource_group_name = resource_group_name
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "example" {
    name                = "${var.name}-app"
    location            = ade_location
    resource_group_name = resource_group_name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
        dotnet_framework_version = "v4.0"
    }

    app_settings = {
        "WEBSITE_RUN_FROM_PACKAGE" = "1"
    }
}

output "app_service_name" {
  description = "The name of the App Service"
  value       = azurerm_app_service.example.name
}

output "app_service_plan_name" {
  description = "The name of the App Service Plan"
  value       = azurerm_app_service_plan.example.name
}