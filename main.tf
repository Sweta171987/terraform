# Provider Configuration
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# App Service Plan
resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Windows"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Web App
resource "azurerm_app_service" "example" {
  name                = var.web_app_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
    always_on                = true
  }
}

# SQL Database
resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = var.sql_server_admin_username
  administrator_login_password = var.sql_server_admin_password
}

resource "azurerm_sql_database" "example" {
  name                = var.sql_database_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_name         = azurerm_sql_server.example.name
  sku_name            = "S0"
  auto_pause_delay    = 60
  auto_pause_grace_period = "PT1H"
  restore_point_in_time = "2022-02-07T07:23:21Z"
}
