provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "client_rg" {
  for_each    = var.clients
  name        = each.value.resource_group_name
  location    = "East US"
}

resource "azurerm_storage_account" "client_sa" {
  for_each                = var.clients
  name                    = each.value.storage_account_name
  resource_group_name     = azurerm_resource_group.client_rg[each.key].name
  location                = azurerm_resource_group.client_rg[each.key].location
  account_tier            = "Standard"
  account_replication_type = "GRS"
}

output "storage_account_primary_access_key" {
  value = { for k, sa in azurerm_storage_account.client_sa : k => sa.primary_access_key }
}
