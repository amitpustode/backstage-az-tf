variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "resource_group_name" {
  default = "example-rg"
}
variable "location" {
  default = "East US"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
