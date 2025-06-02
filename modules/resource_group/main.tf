resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix_name}-rg"
  location = var.resource_group_location
  tags     = var.common_tags
}
