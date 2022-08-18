locals {
    vnet = "AMIS-USE2-XVNET-IAC-CHALLENGE"
    subnet = "AMIS-USE2-SNET01-IAC-CHALLENGE"
}

data "azurerm_virtual_network" "vnet" {
    name = local.vnet
    resource_group_name = data.azurerm_resource_group.network_rg.name
}

data "azurerm_subnet" "internal" {
    name = local.subnet
    resource_group_name = data.azurerm_resource_group.network_rg.name
    virtual_network_name = local.vnet
}