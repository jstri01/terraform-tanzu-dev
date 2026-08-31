#############################################################
# Terraform Deployment Namespace
#
# Purpose:
# Create a dedicated namespace for Terraform-managed
# Tanzu / VKS resources.
#
# Namespace:
# dev-terraform-deployment-ns
#
# Future resources:
# - Tanzu / VKS Clusters
# - Supporting Kubernetes objects
#
#############################################################

data "kubernetes_namespace" "terraform_deployment_ns" {

  metadata {

    name = "dev-terraform-deployment-ns"

    labels = {
      managed-by  = "terraform"
      environment = "dev"
    }

  }

}
