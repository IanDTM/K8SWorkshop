# verify that the images are in the Container Registry
az acr repository list \
    --name $ACR_NAME \
    --output table

    