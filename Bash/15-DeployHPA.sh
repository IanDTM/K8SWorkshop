# Deploy Horizontal Pod Autoscaler
kubectl apply \
    --namespace ratingsapp \
    -f ratings-api-hpa.yaml

# Run a load test
LOADTEST_API_ENDPOINT=http://<frontend hostname>/api/loadtest

# Create test container
#az container create \
#    -g $RESOURCE_GROUP \
#    -n loadtest \
#    --cpu 2 \
#    --memory 1 \
#    --image azch/artillery \
#    --restart-policy Always \
#    --command-line "artillery quick -r 500 -d 240 $LOADTEST_API_ENDPOINT"

# Run a load generator
# Use an another shell window to run this
kubectl run test-load --rm --tty -i --restart='Never' --image devth/alpine-bench --command -- /go/bin/main \
     -n 10000 -c 900 -s 300 http://frontend.<ip-address>.nip.io/api/loadtest

# Watch scaling
    kubectl get hpa \
  --namespace ratingsapp -w