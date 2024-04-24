locals {
  kube_config = pathexpand("~/.kube/config")
}

resource "kind_cluster" "cluster" {
  name            = var.cluster_name
  node_image      = "kindest/node:v1.27.1"
  kubeconfig_path = local.kube_config
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
      extra_port_mappings {
        container_port = 30080
        host_port      = 30070


      }

    }

    node {
      role = "worker"

    }
  }
}
