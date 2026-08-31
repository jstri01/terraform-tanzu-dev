#############################################################
# Terraform Version Requirements
#
# This file defines:
# - Minimum Terraform version
# - Required providers
#
# Think of providers as plugins that allow Terraform
# to communicate with external systems such as:
#
# - VMware vSphere
# - Kubernetes
# - AWS
# - Azure
#
#############################################################

terraform {

  required_version = ">= 1.16.0"

  required_providers {

    #########################################################
    # VMware vSphere Provider
    #########################################################
    vsphere = {
      source  = "vmware/vsphere"
      version = "~> 2.13"
    }

  }
}