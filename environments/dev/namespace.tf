#############################################################
# Supervisor Namespace Lookup
#
# Purpose:
# Verify Terraform can successfully connect to the
# Supervisor Cluster API and read existing objects.
#
# This data source DOES NOT create anything.
#
# Existing Namespace:
# dev-demo-ns
#
# Successful execution proves:
#
# Terraform
#     ↓
# Kubernetes Provider
#     ↓
# Supervisor Cluster API
#     ↓
# Existing Namespace Read
#
#############################################################

data "kubernetes_namespace" "dev_demo_ns" {

  metadata {
    name = "dev-demo-ns"
  }

}