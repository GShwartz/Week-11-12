variable "resource_group_location" {
  description   = "Location of the resource group."
}

variable "agent_count" {
  description = "Number of agents"
}

variable "dns_prefix" {
  description = "dns name prefix"
}

variable cluster_name {
  description = "Cluster Name"
}

variable resource_group_name {
  description = "resource group name"
}

variable location {
  description = "Location"
}

variable aks_service_principal_app_id {
  description = "aks_service_principal_app_id"
}

variable aks_service_principal_client_secret {
  description = "aks_service_principal_client_secret"
}