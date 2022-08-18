resource "azurerm_network_security_group" "my_nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name

  tags = {
    CreatedBy = "Kym Natividad"
  }
}

resource "azurerm_network_security_rule" "my_security_rule" {
  name                        = "Allow SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.my_rg.name
  network_security_group_name = azurerm_network_security_group.my_nsg.name
}