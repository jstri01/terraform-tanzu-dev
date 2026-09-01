#############################################################
# Terraform State Migration
#
# Purpose:
# We are migrating from individual cluster resources:
#
#   kubernetes_manifest.vks_cluster
#   kubernetes_manifest.evo_cluster
#
# to a catalog-based design:
#
#   kubernetes_manifest.clusters["cluster-name"]
#
# These moved blocks instruct Terraform that the
# resources already exist and have simply been renamed.
#
# This prevents Terraform from destroying and
# recreating existing clusters.
#
#############################################################

moved {

  ###########################################################
  # Existing Cluster:
  #
  # terraform-deployed-cluster-01
  #
  ###########################################################

  from = kubernetes_manifest.vks_cluster

  to = kubernetes_manifest.clusters["terraform-deployed-cluster-01"]
}

moved {

  ###########################################################
  # Existing Cluster:
  #
  # dev-evo-cluster
  #
  ###########################################################

  from = kubernetes_manifest.evo_cluster

  to = kubernetes_manifest.clusters["dev-evo-cluster"]
}