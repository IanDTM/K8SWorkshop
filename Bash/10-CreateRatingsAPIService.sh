# Apply our YAML file to create the Ratings API Containers
kubectl apply \
    --namespace ratingsapp \
    -f ratings-api-deployment.yaml

# use the following to watch the pods get deployed
kubectl get pods \
    --namespace ratingsapp \
    -l app=ratings-api -w

# Exit the abovbe and check to see if the deployment is complete
kubectl get deployment ratings-api --namespace ratingsapp

# Create the Ratings API Service
kubectl apply \
    --namespace ratingsapp \
    -f ratings-api-service.yaml

# check the status of the service
kubectl get service ratings-api --namespace ratingsapp
