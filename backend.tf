#terraform {
#  backend "azurerm" {}
#}

resource_group_name = "test-rg"
storage_account_name = "test-sa"
container_name = "test-ca"
key = "/dev/ts.state"
access_key = "xxxxxx-xxxx-xxxxx-xxxxx-xxxxxxx"
