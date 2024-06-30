

resource "azurerm_public_ip" "example" {
    for_each = var.vam_prac
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"


}