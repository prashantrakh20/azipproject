resource "azurerm_storage_account" "example" {
  name                     = "${var.prefix}datalakeaccount"
  resource_group_name      = var.rsgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "example" {
  name               = "${var.prefix}-datalakefilesystem"
  storage_account_id = azurerm_storage_account.example.id

   
  
}