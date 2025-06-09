terraform {
  backend "azurerm" {
    resource_group_name = "xxxxx"
    storage_account_name = "xxxxx"
    container_name = xxxxx"
    key = "xxx/xxxx.tfstate"
    access_key = "xxxxxx-xxxx-xxxxx-xxxxx-xxxxxxx"
  }
}
