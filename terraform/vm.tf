resource "azurerm_linux_virtual_machine" "main" {
  name                            = "VM-kynatividad"
  resource_group_name             = azurerm_resource_group.my_rg.name
  location                        = azurerm_resource_group.my_rg.location
  size                            = "Standard_DS1_v2"
  admin_username                  = "kynatividad"
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  admin_ssh_key {
    username = "kynatividad"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Premium_LRS"
    caching              = "ReadWrite"
  }

  tags = {
    Key = "Application"
    Value = "IaC_Challenge"
    CreatedBy = "Kym Natividad"
  }
}