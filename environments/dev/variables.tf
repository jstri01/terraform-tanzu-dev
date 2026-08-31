#############################################################
# vCenter Variables
#
# Variables allow us to separate:
#
#   Code
#   from
#   Environment-specific values
#
# This makes our Terraform code reusable across:
#
# - DEV
# - TEST
# - PROD
#
#############################################################

#############################################################
# vCenter Server
#############################################################

variable "vsphere_server" {

  description = "vCenter FQDN or IP Address"

  type = string
}

#############################################################
# vCenter Username
#############################################################

variable "vsphere_user" {

  description = "vCenter Username"

  type = string
}

#############################################################
# vCenter Password
#############################################################

variable "vsphere_password" {

  description = "vCenter Password"

  type      = string
  sensitive = true
}
#############################################################
# Datacenter Name
#############################################################

variable "datacenter_name" {

  description = "DEV Datacenter Name"

  type = string
}

#############################################################
# Cluster Name
#############################################################

variable "cluster_name" {

  description = "vSphere Cluster Name"

  type = string
}

#############################################################
# Storage Policy Name
#############################################################

variable "storage_policy_name" {

  description = "Storage Policy Name"

  type = string
}

#############################################################
# Content Library Name
#############################################################

variable "content_library_name" {

  description = "Content Library Name"

  type = string
}

#############################################################
# Datastore Name
#############################################################

variable "datastore_name" {

  description = "Primary datastore for DEV workloads"

  type = string
}

#############################################################
# VKS Cluster Variables
#
# Purpose:
# Parameters used when deploying Tanzu/VKS clusters.
#
# Change these values in terraform.tfvars when a
# new cluster request arrives.
#
#############################################################

variable "vks_cluster_name" {
  description = "Name of the VKS cluster."
  type        = string
}

variable "vks_kubernetes_version" {
  description = "Kubernetes version deployed to the cluster."
  type        = string
}

variable "vks_vm_class" {
  description = "VM Class used by control plane and workers."
  type        = string
}

variable "vks_storage_class" {
  description = "Storage Class assigned to cluster volumes."
  type        = string
}

variable "vks_control_plane_count" {
  description = "Number of control plane nodes."
  type        = number
}

variable "vks_worker_count" {
  description = "Number of worker nodes."
  type        = number
}

#############################################################
# EVO Cluster Variables
#
# Purpose:
# Parameters used when deploying the EVO development cluster.
#
#############################################################

variable "evo_cluster_name" {
  description = "EVO cluster name."
  type        = string
}

variable "evo_vm_class" {
  description = "VM Class for EVO."
  type        = string
}

variable "evo_worker_count" {
  description = "Worker count for EVO."
  type        = number
}
