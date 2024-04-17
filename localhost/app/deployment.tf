# Create a pod
resource "kubernetes_deployment" "local_server" {
  metadata {
    name = "hostel"
    labels = {
      App = var.label
    }
    namespace = var.namespace
  }
  spec {
    selector {
      match_labels = {
        App = var.label
      }
    }
    template {
      metadata {
        labels = {
          App = var.label
        }
      }
      spec {
        container {
          image = "nahuels/hostel-app:0.2.0"
          name  = "hostel"
          port {
            container_port = 3199
          }
          resources {
            limits = {
              memory = "1Gi"
            }
            requests = {
              memory = "250Mi"
            }
          }
        }
      }
    }

  }
  depends_on = [kubernetes_namespace.local]
}
