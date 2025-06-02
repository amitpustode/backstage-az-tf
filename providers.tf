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
  skip_provider_registration = true  //# Optional: skip auto-registration of resource providers (can speed up things, but not always recommended)
  #subscription_id = "40930322-89f0-435e-bf59-03332d87f9c1"
  #tenant_id       = "f16593fa-a42d-44cd-b2be-e8393b6251e0"
  #client_id       = "923aee6b-7866-412e-a5c2-2a06b8feb447"
  #client_secret   = "MSZ8Q~D4HQ4kArIN-CQhDZdcVWsUYaVc1XLasaK3"
}