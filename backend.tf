terraform {
  backend "azurerm" {
  resource_group_name = "test-rg"
  storage_account_name = "test-sa"
  container_name = "test-ca"
  key = "tfstatefile/terraform.tfstate"
  }
}
