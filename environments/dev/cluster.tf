#############################################################
# Tanzu / VKS Cluster Deployment
#
# Purpose:
# Deploy a Tanzu Kubernetes Cluster into the
# Supervisor Namespace:
#
#   dev-terraform-deployment-ns
#
# Cluster Name:
#   terraform-deployed-cluster-01
#
# ClusterClass:
#   builtin-generic-v3.6.0
#
# Kubernetes Version:
#   v1.35.5+vmware.1
#
# VM Class:
#   best-effort-small
#
# Storage Class:
#   dev-k8-storagepolicy
#
#############################################################

resource "kubernetes_manifest" "terraform_deployed_cluster_01" {

  manifest = yamldecode(
    file("${path.module}/terraform-deployed-cluster-01.yaml")
  )

}