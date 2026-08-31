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

#############################################################
# Storage Policy ID
#############################################################

output "storage_policy_id" {

  description = "Storage Policy ID"

  value = data.vsphere_storage_policy.dev_k8_storage.id
}

#############################################################
# Content Library ID
#############################################################

output "content_library_id" {

  description = "Content Library ID"

  value = data.vsphere_content_library.dev_tanzu.id
}

#############################################################
# Datastore ID
#############################################################

output "datastore_id" {

  description = "Primary datastore ID"

  value = data.vsphere_datastore.primary_datastore.id
}