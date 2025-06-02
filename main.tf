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

module "network" {
  source                        = "./modules/network"
  location                      = var.resource_group_location
  resource_group_name           = module.resource_group.resource_group_name
  vnet_hub_name                 = "${local.name_prefix}-hub-vnet"
  vnet_hub_address_space        = ["10.0.0.0/16"]
  vnet_spoke_name               = "${local.name_prefix}-spoke-vnet"
  vnet_spoke_address_space      = ["10.1.0.0/16"]
  appgw_subnet_name             = "${local.name_prefix}-appgw-subnet"
  appgw_subnet_address_prefixes = ["10.0.0.0/24"]
  cluster_node_subnet_name   = "${local.name_prefix}-cluster-subnet"
  cluster_node_subnet_prefixes = ["10.1.2.0/24"]
  aks_route_table_name         = "${local.name_prefix}-aks-route-table"
  service_endpoints             = ["Microsoft.Storage"]
  tags                          = module.tagging.tags
  depends_on                    = [module.resource_group]
}

module "app_gateway" {
  source              = "./modules/app_gateway"
  prefix_name         = local.name_prefix
  location            = var.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = module.tagging.tags
  subnet_id           = module.network.appgw_subnet_id
  depends_on = [
    module.network,
    module.resource_group
  ]
}

module "aks" {
  source                  = "./modules/aks"
  prefix_name             = local.name_prefix
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = var.resource_group_location
  k8s_subnet_id           = module.network.cluster_node_subnet_id
  common_tags             = module.tagging.tags
  kubernetes_version      = var.kubernetes_version
  vm_size                 = var.vm_size
  os_disk_size_gb         = var.os_disk_size_gb
  node_count              = var.node_count
  min_count               = var.min_count
  max_count               = var.max_count
  depends_on = [
    module.network,
    module.resource_group
  ]
}

module "windows_jump_host" {
  source                  = "./modules/windows_jump_host"
  prefix_name             = local.name_prefix
  resource_group_name     = module.resource_group.resource_group_name
  resource_group_location = var.resource_group_location
  common_tags             = module.tagging.tags
  vnet_hub_name               = module.network.vnet_hub_name
  bastion_subnet_address      = var.bastion_subnet_address
  bastion_vm_subnet_address   = var.bastion_vm_subnet_address
  dns_label                   = local.dns_label
  admin_username              = var.admin_username
  admin_password              = var.admin_password
  depends_on = [
    module.network,
    module.resource_group
  ]
}

module "acr" {
  source              = "./modules/acr"
  prefix_name         = replace(local.name_prefix, "-", "")
  location            = var.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  aks_principal_id    = module.aks.kubelet_identity_object_id
  common_tags         = module.tagging.tags
  depends_on = [
    module.aks,
    module.resource_group
  ]
}

#data "azuread_service_principal" "aks_kubelet_sp" {
#  client_id = module.aks.kubelet_identity_client_id
#}

module "keyvault" {
  source              = "./modules/keyvault"
  prefix_name         = local.name_prefix
  location            = var.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  common_tags         = module.tagging.tags
  #aks_kubelet_identity = data.azuread_service_principal.aks_kubelet_sp.object_id
  depends_on = [
    module.aks,
    module.network,
    module.resource_group
  ]
}
