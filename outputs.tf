output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "appgw_id" {
  value = module.app_gateway.appgw_id
}

output "app_gateway_name" {
  value = module.app_gateway.app_gateway_name
}

output "appgw_fqdn" {
  value = module.app_gateway.appgw_fqdn
}

#--------------------------------------------------
output "vnet_hub_id" {
  value = module.network.vnet_hub_id
}
output "vnet_hub_name" {
  value = module.network.vnet_hub_name
}

output "vnet_spoke_id" {
  value = module.network.vnet_spoke_id
}
output "vnet_spoke_name" {
  value = module.network.vnet_spoke_name
}

output "appgw_subnet_id" {
  value = module.network.appgw_subnet_id
}
output "appgw_subnet_name" {
  value = module.network.appgw_subnet_name
}

output "cluster_node_subnet_id" {
  value = module.network.cluster_node_subnet_id
}

output "cluster_node_subnet_name" {
  value = module.network.cluster_node_subnet_name
}
#--------------------------------------------------
output "aks_id" {
  value = module.aks.aks_id
}

output "aks_name" {
  value = module.aks.aks_name
}

output "aks_kube_config" {
  value     = module.aks.aks_kube_config
  sensitive = true
}

output "aks_node_resource_group" {
  value = module.aks.aks_node_resource_group
}

#--------------------------------------------------
output "windows_vm_name" {
  value = module.windows_jump_host.windows_vm_name
}

output "windows_vm_private_ip" {
  value = module.windows_jump_host.windows_vm_private_ip
}

output "bastion_host_name" {
  value = module.windows_jump_host.bastion_host_name
}

#--------------------------------------------------
output "acr_name" {
  value = module.acr.acr_name
}
#--------------------------------------------------

output "key_vault_name" {
  value = module.keyvault.key_vault_name
}
#--------------------------------------------------