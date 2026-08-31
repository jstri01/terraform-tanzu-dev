#############################################################
# Output Values
#
# Outputs display useful information after Terraform
# finishes processing our configuration.
#
#############################################################

output "datacenter_id" {

  description = "The vSphere ID of the Development datacenter"

  value = data.vsphere_datacenter.development.id
}
#############################################################
# Cluster ID
#############################################################

output "cluster_id" {

  description = "The vSphere ID of cluster-01"

  value = data.vsphere_compute_cluster.cluster01.id
}