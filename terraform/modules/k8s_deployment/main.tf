resource "kubernetes_namespace" "main" {
  metadata {
    name = var.namespace
  }


}

resource "kubernetes_deployment" "main" {
  metadata {
    name      = var.k8s_deployment.metadata.name
    namespace = kubernetes_namespace.main.metadata[0].name
    labels = {
      app = var.k8s_deployment.app
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = var.k8s_deployment.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.k8s_deployment.app
        }
      }
      spec {
        container {
          name  = var.k8s_deployment.app
          image = var.docker_image

          port {
            container_port = 50505
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "main" {
  metadata {
    name      = kubernetes_deployment.main.metadata[0].name
    namespace = kubernetes_namespace.main.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.main.spec[0].template[0].metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 50505
    }
    type = "LoadBalancer"
  }
}
