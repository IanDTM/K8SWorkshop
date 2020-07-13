# Set the unique names for the Cluster COntainer Registry. These need to be globally unique.
# to set these in your cloud shell type . 00-SetVariables.sh
# the leading . is important.
# if the shell times out at any time - recreate and rerun this script.

REGION_NAME=eastus
RESOURCE_GROUP=aksworkshop
SUBNET_NAME=aks-subnet
VNET_NAME=aks-vnet
# define the Cluster Name - Must be unique
AKS_CLUSTER_NAME=aksworkshop-<My Unique Name>

#define the Container Registry Name - must be unique
ACR_NAME=acr<My Unquie Name>
