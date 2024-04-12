terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }
  }
}

# Configure Kubernetes provider and connect to the Kubernetes API server
provider "kubernetes" {
  host                   = "https://127.0.0.1:6443" //  kubectl cluster-info
  config_context_cluster = "docker-desktop"
  config_path            = "~/.kube/config"
}
