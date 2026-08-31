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