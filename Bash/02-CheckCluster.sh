#Get Cluster Credentials

az aks get-credentials \
    --resource-group $RESOURCE_GROUP \
    --name $AKS_CLUSTER_NAME

# get the list of the nodes in the Cluster
kubectl get nodes
