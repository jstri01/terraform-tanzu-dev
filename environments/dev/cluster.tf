#############################################################
# Tanzu / VKS Cluster Deployment
#
# Purpose:
# Deploy one or more VKS clusters from the
# vks_clusters catalog defined in terraform.tfvars.
#
# Future workflow:
#
# 1. Add a cluster entry to vks_clusters
# 2. terraform plan
# 3. terraform apply
#
#############################################################

resource "kubernetes_manifest" "clusters" {

  for_each = var.vks_clusters

  manifest = yamldecode(
    templatefile(
      "${path.module}/cluster.yaml.tpl",
      {
        cluster_name        = each.key
        kubernetes_version  = each.value.kubernetes_version
        vm_class            = each.value.vm_class
        storage_class       = each.value.storage_class
        control_plane_count = each.value.control_plane_count
        worker_count        = each.value.worker_count
      }
    )
  )
}