variable "prefix_name" {
  type        = string
  description = "Prefix Name"
}

variable "common_tags" {
  type        = map(string)
  description = "Common Tags"
}

variable "resource_group_location" {
  type        = string
  description = "Resource Group Location"
}