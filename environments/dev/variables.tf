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