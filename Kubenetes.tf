resource "azurerm_resource_group" "myTerra" {
  name     = "myResourceGroup1"
  location = "local"
}

resource "azurerm_kubernetes_cluster" "myTerra" {
  name                = "resourceK8S"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.myTerraformGroup.name}"
  dns_prefix          = "acctestagent1"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" #votre subscription id
    client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxx" #votre pass
  }

  tags {
    Environment = "Production"
  }
}