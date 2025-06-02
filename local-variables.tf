resource "random_id" "suffix" {
  byte_length = 3
}

locals {
  name_prefix  = "${var.product_name}-${var.environment}-${var.resource_group_location}"
  dns_label    = "${var.product_name}-${random_id.suffix.hex}"
  #storage_account_name_prefix = "${var.product_name}${var.environment}"
}