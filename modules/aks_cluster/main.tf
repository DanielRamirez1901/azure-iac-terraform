resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
    vnet_subnet_id  = var.vnet_subnet_id
  }

  network_profile {
    network_plugin = var.network_plugin
  }

  identity {
    type = var.identity_type
  }

  key_vault_secrets_provider {
    # update the secrets on a regular basis
    secret_rotation_enabled = var.secret_rotation_enabled
  }

  //private_cluster_enabled = var.private_cluster_enabled
}


resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
  filename   = var.local_file_name
  content    = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}

/*
resource "kubernetes_service_account" "workload_identity_sa" {
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
  metadata {
    name      = var.name_workload_identity
    namespace = var.namespace
    annotations = {
      "azure.workload.identity/client-id" = var.user_assigned_client_id
    }
  }
}
*/