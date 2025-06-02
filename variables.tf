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