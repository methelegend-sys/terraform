terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    skip_provider_registration= true
  features {}
}
resource "azurerm_app_service_plan" "test"{
    name = "demo"
    location = "${var.location}"
    resource_group_name = "${var.resource_group}"

    sku{
        tier = "Free"
        size = "S1"
    }
}

resource "azurerm_app_service" "test"{
    name = "terraformdemo"
    location = "${var.location}"
    resource_group_name = "${var.resource_group}"
    app_service_plan_id = "${azurerm_app_service_plan.test.id}"
}