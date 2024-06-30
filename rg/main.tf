resource "azurerm_resource_group" "rgs" {
    for_each = var.vam_prac
    name = each.value.name
    location = each.value.location
  
}