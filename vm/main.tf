
data "azurerm_network_interface" "example" {
  name                = "first_nic"
  resource_group_name = "tech_b"
}

resource "azurerm_linux_virtual_machine" "virtualmachine1" {
  for_each                        = var.vam_prac
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  disable_password_authentication = false
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password 
  network_interface_ids = [
    data.azurerm_network_interface.example.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}