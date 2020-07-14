# Create another namespace
kubectl create namespace ingress

# Configure Helm to use another repo
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Install an NGINX controller
helm install nginx-ingress stable/nginx-ingress \
    --namespace ingress \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux

# Wait for the External IP address to be obtained
kubectl get service nginx-ingress-controller --namespace ingress -w

# Note down the IP address we will need it.

# Reconfigure the Ratings Web Front service to use Cluster IP -
# Edit the ratings-web-service.yaml file and switch type to ClusterIP

# Delete the old Service
kubectl delete service \
    --namespace ratingsapp \
    ratings-web

# Apply the change
kubectl apply \
    --namespace ratingsapp \
    -f ratings-web-service.yaml

# Need to create an Ingress Controller Resource which defines 
# Edit the ratings-web-ingress.yaml with External IP Address
kubectl apply \
    --namespace ratingsapp \
    -f ratings-web-ingress.yaml

# We use nip.io, which is a free service that provides wildcard DNS. 
# There are alternatives such as xip.io or sslip.io.
# Or use your domain name and set up the proper DNS records.
#
# Open web browser to 
# http://frontend.External-ip-address-parts.nip.io