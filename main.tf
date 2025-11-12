resource "azurerm_resource_group" "terraform_task_2" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "yuriikeniustorage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.terraform_task_2.name
  location                 = azurerm_resource_group.terraform_task_2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "mycontainer" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.yuriikeniustorage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "zip" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.yuriikeniustorage.name
  storage_container_name = azurerm_storage_container.mycontainer.name
  type                   = "Block"
  source                 = "terraform_task_2.zip"
}
