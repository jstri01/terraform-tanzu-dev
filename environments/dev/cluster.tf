#############################################################
# Tanzu / VKS Cluster Deployment
#
# Purpose:
# Deploy a Tanzu Kubernetes Cluster using a reusable
# Terraform template.
#
#############################################################

resource "kubernetes_manifest" "vks_cluster" {

  manifest = yamldecode(
    templatefile(
      "${path.module}/cluster.yaml.tpl",
      {
        cluster_name        = var.vks_cluster_name
        kubernetes_version  = var.vks_kubernetes_version
        vm_class            = var.vks_vm_class
        storage_class       = var.vks_storage_class
        control_plane_count = var.vks_control_plane_count
        worker_count        = var.vks_worker_count
      }
    )
  )
}

#############################################################
# EVO Development Cluster
#
# Purpose:
# Deploy a dedicated development cluster for the
# EVO application team.
#
# This resource uses the same validated ClusterClass
# and Kubernetes version that were successfully used
# for terraform-deployed-cluster-01.
#
#############################################################

resource "kubernetes_manifest" "evo_cluster" {

  manifest = yamldecode(
    templatefile(
      "${path.module}/cluster-evo.yaml.tpl",
      {
        cluster_name        = var.evo_cluster_name
        kubernetes_version  = var.vks_kubernetes_version
        vm_class            = var.evo_vm_class
        storage_class       = var.vks_storage_class
        control_plane_count = 1
        worker_count        = var.evo_worker_count
      }
    )
  )
}