resource "azurerm_app_service_plan" "example" {
    name                = "${var.name}-asp"
    location            = ade_environment_location
    resource_group_name = ade_resource_group_name
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "example" {
    name                = "${var.name}-app"
    location            = ade_environment_location
    resource_group_name = ade_resource_group_name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
        dotnet_framework_version = "v4.0"
    }

    app_settings = {
        "WEBSITE_RUN_FROM_PACKAGE" = "1"
    }
}