resource "azurerm_network_interface" "main" {
    name = "main-kynatividad"
    location = azurerm_resource_group.my_rg.location
    resource_group_name = azurerm_resource_group.my_rg.name

    ip_configuration {
        name = "mainNicConfiguration"
        subnet_id = data.azurerm_subnet.internal.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }

    tags = {
        CreatedBy = "Kym Natividad"
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.my_nsg.id
}

resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-for-test-vm"
  resource_group_name = azurerm_resource_group.my_rg.name
  location            = azurerm_resource_group.my_rg.location
  allocation_method   = "Dynamic"

  tags = {
        CreatedBy = "Kym Natividad"
  }
}