# Create a Insights Workspace
az resource create --resource-type Microsoft.OperationalInsights/workspaces \
        --name $WORKSPACE \
        --resource-group $RESOURCE_GROUP \
        --location $REGION_NAME \
        --properties '{}' -o table

# Enable AKS Monitoring 
WORKSPACE_ID=$(az resource show --resource-type Microsoft.OperationalInsights/workspaces \
    --resource-group $RESOURCE_GROUP \
    --name $WORKSPACE \
    --query "id" -o tsv)

az aks enable-addons \
    --resource-group $RESOURCE_GROUP \
    --name $AKS_CLUSTER_NAME \
    --addons monitoring \
    --workspace-resource-id $WORKSPACE_ID

# Login into Azure Portal
# review Monitoring

# Enable RBAC Role Binding
kubectl apply \
    -f logreader-rbac.yaml

# View Live Log Data.
