terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }
  }
}

# Configure Kubernetes provider and connect to the Kubernetes API server
resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = " kubectl config use-context docker-desktop"
  }
}

provider "kubernetes" {
  host                   = "https://127.0.0.1:6443" //  kubectl cluster-info
  config_context_cluster = var.config_context_cluster
  config_path            = "~/.kube/config"
}

module "app" {
  source                 = "../app/"
  config_context_cluster = var.config_context_cluster
  namespace              = var.namespace
  depends_on             = [null_resource.kubectl]
}
