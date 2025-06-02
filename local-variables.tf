locals {
  name_prefix                 = "${var.product_name}-${var.environment}-${var.resource_group_location}"
  #storage_account_name_prefix = "${var.product_name}${var.environment}"
}