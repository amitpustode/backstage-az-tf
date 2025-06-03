variable "resource_group_location" {
  type        = string
  description = "Resource Group Location"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "product_name" {
  type        = string
  description = "Product Name"
}

variable "app_name" {
  description = "The name of the application."
  type        = string
}

##------------------------------------------------------
variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "The Azure Client ID (Application ID) of the Service Principal"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "The Azure Client Secret of the Service Principal"
  type        = string
  sensitive   = true
}
##------------------------------------------------------
