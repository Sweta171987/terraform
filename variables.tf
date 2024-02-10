variable "resource_group_name" {
  description = "The name of the resource group in which to create resources."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create resources."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "web_app_name" {
  description = "The name of the Web App."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "sql_server_admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}

variable "sql_server_admin_password" {
  description = "The administrator password for the SQL Server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL Database."
  type        = string
}
