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
#-----------------------
variable "kubernetes_version" {
  type    = string
  default = "1.31.8"
}

variable "vm_size" {
  type    = string
  default = "Standard_D4s_v3"
}

variable "os_disk_size_gb" {
  type    = number
  default = 100
}

variable "node_count" {
  type    = number
  default = 2
}

variable "min_count" {
  type    = number
  default = 2
}

variable "max_count" {
  type    = number
  default = 3
}

#-----------------------

variable "bastion_subnet_address" {
  description = "CIDR range for Azure Bastion Subnet"
  type        = list(string)
  default     = ["10.0.3.0/27"]  # must be at least /27
}

variable "bastion_vm_subnet_address" {
  description = "Address prefix for the subnet used by the Windows jump host VM"
  type        = string
  default     = "10.0.4.0/27"
}

#-----------------------
variable "admin_username" {
  description = "Username for Windows VM"
  type        = string
  sensitive   = true
}
variable "admin_password" {
  description = "Password for Windows VM"
  type        = string
  sensitive   = true
}
#-----------------------


