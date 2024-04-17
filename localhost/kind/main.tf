provider "kind" {}


resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = " kubectl config use-context kind-kind-local"
  }
}
provider "kubernetes" {
  config_path = local.kube_config
}

module "app" {
  source                 = "../app/"
  config_context_cluster = var.config_context_cluster
  namespace              = var.namespace
}
