### Terraform Block
terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

### Provider Block
provider "azurerm" {
  features {}
  #skip_provider_registration = true
  subscription_id = "xxxxxx-xxxx-xxxxx-xxxxx-xxxxxxx"
  tenant_id = "xxxxxx-xxxx-xxxxx-xxxxx-xxxxxxx"
  client_id = "xxxxxx-xxxx-xxxxx-xxxxx-xxxxxxx"
  client_secret = "xxxxxx-xxxx-xxxxx-xxxxx-xxxxxxx"
}
