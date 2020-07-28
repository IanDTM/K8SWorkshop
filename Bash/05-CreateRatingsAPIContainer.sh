# make sure we are in the root of our Project
cd ~/K8SWorkshop

# Clone from the Microsoft public repository part of our application
git clone https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-api.git

# change directory to our new project directory
cd mslearn-aks-workshop-ratings-api

# Look at the dockerfile
cat Dockerfile

# Build the code and create the Docker container image 
az acr build \
    --resource-group $RESOURCE_GROUP \
    --registry $ACR_NAME \
    --image ratings-api:v1 .

