data "azurerm_resource_group" "network_rg" {
    name = "AMIS-USE2-SANDBOX-IAC-CHALLENGE-RGRP00"    
}

resource "azurerm_resource_group" "my_rg" {
  name      = "AMIS-USE2-SANDBOX-kynatividad-RGRP"
  location  = data.azurerm_resource_group.network_rg.location

  tags = {
    AppDomain = "Automation Challenge"
    AppDomainOwner = "Kym Natividad"
  }
}