#!/bin/bash

# Obtener el nombre del grupo de recursos
resourceGroupName=$(terraform output -raw resource_group_name)

# Obtener el nombre de la aplicación de la puerta de enlace de aplicaciones
applicationGatewayName=$(terraform output -raw application_gateway_name)

# Obtener el nombre del cluster
clusterName=$(terraform output -raw cluster_name)

# Ejecutar el comando de Azure CLI con los valores obtenidos
appgwId=$(az network application-gateway list -g $resourceGroupName --query "[?name=='$applicationGatewayName'].id" -o tsv)

export AKS_OIDC_ISSUER="$(az aks show --resource-group $resourceGroupName --name $clusterName --query "oidcIssuerProfile.issuerUrl" -o tsv)"

# Habilita los addons para la puerta de enlace de aplicaciones
az aks enable-addons -n $clusterName -g $resourceGroupName -a ingress-appgw --appgw-id $appgwId

# Activa el managed identity
az aks update -g $resourceGroupName -n $clusterName --enable-managed-identity

ssh-keygen -t rsa -b 4096 -f ~/.ssh/vm-deploy-key

# mv kubeconfig ~/.kube/config
# az vm show --resource-group <nombre-del-grupo-de-recursos> --name <nombre-de-la-vm> --query "id" --output tsv
# az network bastion ssh --name kratos-controller --resource-group apiK8sRss --target-resource-id /subscriptions/c767cbb2-4029-465b-ad2c-087472194b4b/resourceGroups/apiK8sRss/providers/Microsoft.Compute/virtualMachines/tf-linux-vm-01 --auth-type "ssh-key" --username adminuser --ssh-key ~/.ssh/vm-deploy-key
# az network bastion ssh --name <bastion-host-name> --resource-group <resource-group-name> --target-resource-id <vm-id> --auth-type "ssh-key" --username <username-ssh>--ssh-key ~/.ssh/vm-deploy-key

# Imprimir los valores de las variables
echo "Resource Group Name: $resourceGroupName"
echo "Application Gateway Name: $applicationGatewayName"
echo "Cluster Name: $clusterName"
echo "Application Gateway ID: $appgwId"
echo $AKS_OIDC_ISSUER
