resource "helm_release" "aks_secret_provider" {
  name    = var.helm_name
  chart   = var.helm_chart
  version = var.helm_version
  values = [yamlencode({
    vaultName = var.helm_vaulname
    tenantId  = var.helm_tenandid
    clientId  = var.helm_clientid
    secrets   = var.helm_secrets
  })]
  force_update = var.helm_force_update
}

provider "helm" {
  kubernetes {
    host                   = var.host
    client_certificate     = base64decode(var.client_certificate)
    client_key             = base64decode(var.client_key)
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}





