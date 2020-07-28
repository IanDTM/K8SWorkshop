#
# Important EDIT the ratings-web-deployment
#

# Deploy the Web Containers to the K8S cluster
kubectl apply \
--namespace ratingsapp \
-f ratings-web-deployment.yaml

# use the following to watch the pods get deployed
kubectl get pods \
    --namespace ratingsapp \
    -l app=ratings-web -w

# Exit the above using <contrl>C and check to see if the deployment is complete
kubectl get deployment ratings-web --namespace ratingsapp

# Create the web front end service
kubectl apply \
    --namespace ratingsapp \
    -f ratings-web-service.yaml

# It takes a while to complete and get a public IP Address
kubectl get service ratings-web --namespace ratingsapp -w

#
# You can now use the External IP address to access the Application.
#
# Application is now up and running. Wait for Public IP to be bound and accepting traffic

