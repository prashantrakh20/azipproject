resource "azurerm_storage_account" "example" {
  name                     = "${var.prefix}storageaccount9960"
  resource_group_name      = var.rsgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"


  network_rules {
    default_action             = "Allow"
    virtual_network_subnet_ids = [var.subnet_id]
  }

 tags = var.tags

}

resource "azurerm_storage_container" "example" {
  name                  = "${var.prefix}storagecontainer9960"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = "${var.prefix}blobstorage"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
 
}
