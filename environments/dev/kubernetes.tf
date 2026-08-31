#############################################################
# Kubernetes Provider Configuration
#
# Purpose:
# Establish a connection from Terraform to the
# VMware vSphere Supervisor Cluster.
#
# Terraform will use the same kubeconfig file
# already being used successfully by kubectl.
#
# Current Supervisor API:
# https://10.72.229.33
#
# This provider will eventually be used to:
#
# - Create Kubernetes namespaces
# - Deploy Cluster API resources
# - Create Tanzu/VKS clusters
#
# No resources are created by this file.
#
#############################################################

provider "kubernetes" {

  # Use the local kubeconfig file already
  # validated with kubectl commands.
  config_path = pathexpand("~/.kube/config")

}