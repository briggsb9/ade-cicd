output "app_service_name" {
  description = "The name of the App Service"
  value       = azurerm_app_service.example.name
}

output "app_service_plan_name" {
  description = "The name of the App Service Plan"
  value       = azurerm_app_service_plan.example.name
}