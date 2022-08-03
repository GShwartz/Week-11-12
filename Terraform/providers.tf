terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Terraform_Storage"
    storage_account_name = "terraformtfstate1982"
    container_name       = "tfstate"
    key                  = "terraform.state"

  }
}

provider "azurerm" {
  features {}
  subscription_id   = "25ce029c-138c-4b4c-9626-2b721b42cc07"
  tenant_id         = "fb0457bd-2dee-4de3-856c-cdc97c8ad092"
  client_id         = "0066ad24-af35-4cd3-a496-fa12bc08c971"
  client_secret     = "9xA8Q~Hh51HORUHPFwZ-A2z6qM0hdcHuHW_sMcFI"

}