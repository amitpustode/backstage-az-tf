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
  #skip_provider_registration = true  //# Optional: skip auto-registration of resource providers (can speed up things, but not always recommended)
  subscription_id = "715512ac-92a9-409c-8f40-6fe60ab0f1e7"
  tenant_id = "28367600-f4b9-456b-9969-d665d0e5f1aa "
  client_id = "c7961855-8184-43ce-82e0-1bd52ae33cef"
  client_secret = "Azk8Q~Lqrq7c6h9blOCPvIMc.q3bE.eobw8~ibqz"
}
