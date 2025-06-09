terraform {
  backend "azurerm" {
    resource_group_name = "tf-infra-RG"
    storage_account_name = "tfinfrasa"
    container_name = "tf-state"
    key = "dev/devtf.tfstate"
    access_key = "xxxxxx-xxxx-xxxxx-xxxxx-xxxxxxx"
  }
}
