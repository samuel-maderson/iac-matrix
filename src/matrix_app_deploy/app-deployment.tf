# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "myapp1" {
  metadata {
    name = "matrix-deployment"
    namespace = "dev"
    labels = {
      app = "matrix"
    }
  } 
 
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "matrix"
      }
    }

    template {
      metadata {
        labels = {
          app = "matrix"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "matrix"
          port {
            container_port = 80
          }
          }
      }
    }
  }
}

