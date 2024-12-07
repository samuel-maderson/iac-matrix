# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "myapp1" {
  metadata {
    name = "smmlwebsite-deployment"
    namespace = "dev"
    labels = {
      app = "smmlwebsite"
    }
  } 
 
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "smmlwebsite"
      }
    }

    template {
      metadata {
        labels = {
          app = "smmlwebsite"
        }
      }

      spec {
        container {
          image = "samuelmadersondev/smml-website:latest"
          name  = "smmlwebsite"
          port {
            container_port = 80
          }
          }
        image_pull_secrets {
          name = "my-dockerhub-secret"
        }

      }
    }
  }
}

