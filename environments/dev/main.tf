#############################################################
# VMware vSphere Provider Configuration
#
# Purpose:
# Establish a connection from Terraform to the DEV vCenter.
#
# Environment:
# dev-vc-01.int.distco.com
# 10.70.205.60
#
# This configuration does NOT create or modify anything.
#
#############################################################

provider "vsphere" {

  user     = var.vsphere_user
  password = var.vsphere_password

  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

#############################################################
# Datacenter Lookup
#
# This is our first vSphere data source.
#
# Data sources allow Terraform to READ existing
# infrastructure without creating or modifying anything.
#
# In this case we are telling Terraform:
#
# "Find the Datacenter named Development"
#
#############################################################

data "vsphere_datacenter" "development" {

  name = var.datacenter_name
}
#############################################################
# Cluster Lookup
#
# Find the vSphere Cluster where workloads run.
#
#############################################################

data "vsphere_compute_cluster" "cluster01" {

  name = var.cluster_name

  datacenter_id = data.vsphere_datacenter.development.id
}

#############################################################
# Storage Policy Lookup
#
# Locate the Tanzu storage policy used by
# Supervisor and Tanzu workloads.
#
#############################################################

data "vsphere_storage_policy" "dev_k8_storage" {

  name = var.storage_policy_name
}

#############################################################
# Content Library Lookup
#
# Tanzu uses content libraries to provide
# Kubernetes node images.
#
#############################################################

data "vsphere_content_library" "dev_tanzu" {

  name = var.content_library_name
}

#############################################################
# Datastore Lookup
#
# Discover the primary datastore used for
# DEV workloads.
#
#############################################################

data "vsphere_datastore" "primary_datastore" {

  name = var.datastore_name

  datacenter_id = data.vsphere_datacenter.development.id
}