#terraform {
#  backend "azurerm" {}
#}

resource_group_name  = "test-rg"
storage_account_name = "test-sa"
container_name       = "test-ca"
key                  = "testfd/dev-terraform.tfstate"
access_key           = "xxxxxxxxxxxxxxxxxxxxxxxx"
