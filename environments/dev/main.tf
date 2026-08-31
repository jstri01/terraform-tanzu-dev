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

  user                 = var.vsphere_user
  password             = var.vsphere_password

  vsphere_server       = var.vsphere_server

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

  name = "Development"
}
#############################################################
# Cluster Lookup
#
# Find the vSphere Cluster where workloads run.
#
#############################################################

data "vsphere_compute_cluster" "cluster01" {

  name          = "cluster-01"

  datacenter_id = data.vsphere_datacenter.development.id
}
