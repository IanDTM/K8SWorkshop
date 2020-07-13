# make sure we are in the root of our project
cd ~/K8SWorkshop

# clone The Microsoft example web app code.
git clone https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-web.git

# change directory into the web app code.
cd mslearn-aks-workshop-ratings-web

# Build the code and the docker image and push to the container registry we created.
az acr build \
    --resource-group $RESOURCE_GROUP \
    --registry $ACR_NAME \
    --image ratings-web:v1 .

    