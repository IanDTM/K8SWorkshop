# Create a Private Container Registry

az acr create \
    --resource-group $RESOURCE_GROUP \
    --location $REGION_NAME \
    --name $ACR_NAME \
    --sku Standard

# Login to Azure Portal and review the Contain registry
