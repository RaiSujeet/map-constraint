data "azurerm_subnet" "example" {
  name                 = "first_subnet"
  virtual_network_name = "first_vnet"

  resource_group_name  = "tech_b"
}

data "azurerm_public_ip" "example" {
  name                = "frist_public_ip"
  resource_group_name = "tech_b"
}

resource "azurerm_network_interface" "example" {
    for_each = var.vam_prac
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.example.id
  }
}