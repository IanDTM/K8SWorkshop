# Create a Cert Manager
kubectl create namespace cert-manager

# Add additional Repo
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Install Cert Manager
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.14/deploy/manifests/00-crds.yaml

# Install Cert-Manager Helm chart
helm install cert-manager \
    --namespace cert-manager \
    --version v0.14.0 \
    jetstack/cert-manager

# verify installation
kubectl get pods --namespace cert-manager

# Deploy a Cluster Issuer resource for "Let's Encrypt"
kubectl apply \
    --namespace ratingsapp \
    -f cluster-issuer.yaml

# Edit the ratings-web-ingress-ssl.yaml file and enter the External IP Adress
# Enable SSL
kubectl apply \
    --namespace ratingsapp \
    -f ratings-web-ingress-ssl.yaml

# Verify Certificate is being issued
kubectl describe cert ratings-web-cert --namespace ratingsapp

# Now test using SSL
# Open browser to https://frontend.External-ip-address-parts.nip.io