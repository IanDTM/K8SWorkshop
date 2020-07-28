# Replay the modified ratings-api-deployment.yaml with modifications from ratings-api-deployment.yaml
kubectl apply \
    --namespace ratingsapp \
    -f ratings-api-deployment.yaml

# Watch the new Pods rolling out
kubectl get pods \
    --namespace ratingsapp \
    -l app=ratings-api -w

# Configure the Auto scaler
az aks update \
--resource-group $RESOURCE_GROUP \
--name $AKS_CLUSTER_NAME  \
--enable-cluster-autoscaler \
--min-count 3 \
--max-count 5

# Verify the number of Pods
kubectl get nodes -w
