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