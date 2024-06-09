#!/bin/bash

set -e

# Obtener el nombre del grupo de recursos
resourceGroupName=$(terraform output -raw resource_group_name)
echo "Resource Group Name: $resourceGroupName"

# Obtener el nombre de la aplicación de la puerta de enlace de aplicaciones
applicationGatewayName=$(terraform output -raw application_gateway_name)
echo "Application Gateway Name: $applicationGatewayName"

acr_name=$(terraform output -raw acr_name)
echo "ACR Name: $acr_name"

# Obtener el nombre del cluster
clusterName=$(terraform output -raw cluster_name)
echo "Cluster Name: $clusterName"

# Ejecutar el comando de Azure CLI con los valores obtenidos
appgwId=$(az network application-gateway list -g $resourceGroupName --query "[?name=='$applicationGatewayName'].id" -o tsv)
echo "Application Gateway ID: $appgwId"

export AKS_OIDC_ISSUER="$(az aks show --resource-group $resourceGroupName --name $clusterName --query "oidcIssuerProfile.issuerUrl" -o tsv)"
echo "AKS OIDC Issuer: $AKS_OIDC_ISSUER"

# Obtener el nombre del bastion host
bastionHostName=$(terraform output -raw bastion_host_name)
echo "Bastion Host Name: $bastionHostName"

#Obtener el nombre de la maquina virtual
vm_name=$(terraform output -raw vm_name)
echo "Virtual Machine Name: $vm_name"

# Obtener el ID de la VM
vmId=$(az vm show --resource-group $resourceGroupName --name $vm_name --query "id" --output tsv)
echo "VM ID: $vmId"

# Habilita los addons para la puerta de enlace de aplicaciones
az aks enable-addons -n $clusterName -g $resourceGroupName -a ingress-appgw --appgw-id $appgwId

# Activa el managed identity
az aks update -g $resourceGroupName -n $clusterName --enable-managed-identity

az acr login --name $acr_name

# Generar la clave SSH solo si no existe
if [ ! -f ~/.ssh/vm-deploy-key ]; then
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/vm-deploy-key -N ""
else
    echo "SSH key already exists, skipping generation."
fi

echo "Script ejecutado correctamente."

# mv kubeconfig ~/.kube/config
# az vm show --resource-group <nombre-del-grupo-de-recursos> --name <nombre-de-la-vm> --query "id" --output tsv 
# az vm show --resource-group apiK8sRss  --name tf-linux-vm-01 --query "id" --output tsv       
# az network bastion ssh --name $bastionHostName --resource-group $resourceGroupName --target-resource-id $vmId --auth-type "ssh-key" --username adminuser --ssh-key ~/.ssh/vm-deploy-key
# az network bastion ssh --name <bastion-host-name> --resource-group <resource-group-name> --target-resource-id <vm-id> --auth-type "ssh-key" --username <username-ssh>--ssh-key ~/.ssh/vm-deploy-key


# Para configurar bastion
# curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
# curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl
# az login
# az aks get-credentials --name myCluster --resource-group apiK8sRss --admin
# kubectl get namespaces
# kubectl logs pod/dependent-envars-demo
