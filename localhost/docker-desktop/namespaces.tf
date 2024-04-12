resource "kubernetes_namespace" "local" {
  metadata {
    name = var.namespace
    labels = {
      my_label = var.label
    }

  }
}
