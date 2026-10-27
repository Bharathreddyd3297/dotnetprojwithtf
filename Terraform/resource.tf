resource "azurerm_resource_group" "rg" {
  name = var.rgname
  location = var.location
}

resource "azurerm_service_plan" "asp" {
  name = var.asp
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  os_type = "Windows"
  sku_name = "B1"
}

resource "azurerm_windows_web_app" "webapp" {
  name = var.webapp
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  service_plan_id = azurerm_service_plan.asp.id
  site_config {}
}