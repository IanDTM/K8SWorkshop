# Using Helm we will deploy a Mongo DB Chart. Helm is already installed in Azure Cloud Shell

# Add the bitnami repo
helm repo add bitnami https://charts.bitnami.com/bitnami

# List the charts available.
helm search repo bitnami

# Helm chart define a series of files to be used for a K8S deployment 
# Note: before running modify the username and password to be used. 
# Tip: use a simplae password to avoid Url Issues.
helm install ratings bitnami/mongodb \
    --namespace ratingsapp \
    --set auth.username=<username>,auth.password=<password>,auth.database=ratingsdb

# Create a Secret in K8S to hold connection string
# Note - modify the string using the vaklues you used above.
kubectl create secret generic mongosecret \
    --namespace ratingsapp \
    --from-literal=MONGOCONNECTION="mongodb://<username>:<password>@ratings-mongodb.ratingsapp:27017/ratingsdb"

# Validate  secret was created
kubectl describe secret mongosecret --namespace ratingsapp

