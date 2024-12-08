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
    replicas = 2

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
          image = "992382477890.dkr.ecr.us-east-1.amazonaws.com/matrix-ecr:myapp1_v4"
          name  = "matrix"
          port {
            container_port = 80
          }
          }
      }
    }
  }
}

