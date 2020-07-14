# Deploy Horizontal Pod Autoscaler
kubectl apply \
    --namespace ratingsapp \
    -f ratings-api-hpa.yaml

# Run a load test
LOADTEST_API_ENDPOINT=https://<frontend hostname>/api/loadtest

# Create test container
az container create \
    -g $RESOURCE_GROUP \
    -n loadtest \
    --cpu 4 \
    --memory 1 \
    --image azch/artillery \
    --restart-policy Never \
    --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"

# Watch scaling
    kubectl get hpa \
  --namespace ratingsapp -w