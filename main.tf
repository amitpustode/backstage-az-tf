module "tagging" {
  source      = "./modules/tagging"
  environment = var.environment
  labels = {
    appname       = var.app_name
    Project       = "MyProject"
    Department    = "software-products"
    BusinessUnit  = "enterprise"
    CreatedBy     = "devsecops"
    CostCenter    = "dso-01"
  }
}

module "resource_group" {
  source                  = "./modules/resource_group"
  prefix_name             = local.name_prefix
  resource_group_location = var.resource_group_location
  common_tags             = module.tagging.tags
}
