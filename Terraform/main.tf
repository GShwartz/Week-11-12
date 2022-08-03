resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location  = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
    depends_on = [azurerm_resource_group.rg]

    name                = var.cluster_name
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix          = var.dns_prefix

    linux_profile {
        admin_username = "gazurestudent"

        ssh_key {
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDofWxeSihpXtTDWnwZzE+72yLQMkFw7y3TjJ8Aoif0e6HGU5rvniqNHXQErACUKPvQKNXajLzEPzYPmlqUIZwsaZisd63GAmNqWJAwwZ/FOXYsN4szvnnMEyaPQJZ2A9BSk9GuVZAyjXrZgbDXGj4X21XMmkwOmQaTDiyxvWu3Ee4ETSQ33Vc9CoGh1nSUGDOLEl0MOBrTdr9nXWpSyp57x/Y6jAJ25erLlHnU9LnrF2bSN2unsnAOFJFWTc7SQxldcKnttpSgyAoXtUujZ2vdXtqs3/x+M/u3W+UJHqVZaAxFNDkn38l/ijdn0WOAvba1adj92qySVlqOQgBrSXIjzY35IOvQiLn/yFR3gzyBvTGNS35IPql7E7CVSaDTlManjt5kDdmmNrO+Qrs69U5N5HpiF4HfuL618RnQKsOnInEEaqwahk+0XErgGUMPyTwJnRhy6OumXbCGySgszuH6RUCM3weFmxP6oAR23ciHVPCtt/Fcq0/13f2/3wobYmFzQ0acWktp+ryzBxxrc5p/1gq5McPdm3LkVjCF58Xj7X+W8wf9xxCuyYmd2xaQKQGwAUrwT98qyPowektzybRU7XkJnxv7TFJOH7iaZNPyzhD86dGLsojdvIgfYKBc4Dr9YMoHhLj9pGvrPiKBxTY2gZ93vk+oU+lLdDO6sjCzHQ==\n gilsh@Win-Virt-Client-2\n"
        }
    }

    service_principal {
        client_id     = var.aks_service_principal_app_id
        client_secret = var.aks_service_principal_client_secret
    }

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = "Standard_B2ms"
    }

    network_profile {
        load_balancer_sku = "standard"
        network_plugin = "kubenet"
    }

    tags = {
        Environment = "Staging"
    }
}