#############################################################
# Tanzu / VKS Cluster Definition
#
# Purpose:
# Define a new VKS cluster that will be deployed into the
# Supervisor Namespace:
#
#   dev-terraform-deployment-ns
#
# Target Cluster:
#   terraform-deployed-cluster-01
#
# ClusterClass:
#   builtin-generic-v3.6.0
#
# Kubernetes Version:
#   v1.35.5+vmware.1
#
#############################################################

apiVersion: cluster.x-k8s.io/v1beta2
kind: Cluster

metadata:

  # Name of the Tanzu Kubernetes Cluster
  name: ${cluster_name}

  # Supervisor Namespace where the cluster will be deployed
  namespace: dev-terraform-deployment-ns

spec:

  #########################################################
  # Cluster Network Configuration
  #
  # Values copied from the working dev-demo-cluster.
  #
  #########################################################

  clusterNetwork:

    pods:
      cidrBlocks:
      - 192.168.0.0/16

    services:
      cidrBlocks:
      - 10.96.0.0/12

  #########################################################
  # Cluster Topology
  #########################################################

  topology:

    classRef:
      name: builtin-generic-v3.6.0
      namespace: vmware-system-vks-public

    version: ${kubernetes_version}

    controlPlane:
      replicas: ${control_plane_count}

    workers:
      machineDeployments:
      - class: node-pool
        name: worker
        replicas: ${worker_count}

    #######################################################
    # Required ClusterClass Variables
    #######################################################

    variables:

    - name: vmClass
      value: ${vm_class}

    - name: storageClass
      value: ${storage_class}

    - name: kubernetes
      value:
        certificateRotation:
          enabled: true
          renewalDaysBeforeExpiry: 90

    - name: bootstrapAddons
      value:
        cniRef:
          name: antrea
          namespace: vmware-system-vks-public
