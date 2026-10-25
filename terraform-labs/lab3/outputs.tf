output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnets" {
  value = {
    web = azurerm_subnet.web.address_prefixes
    db  = azurerm_subnet.db.address_prefixes
  }
}
