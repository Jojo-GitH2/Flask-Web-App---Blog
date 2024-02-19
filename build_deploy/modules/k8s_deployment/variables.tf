variable "namespace" {
  description = "namespace to deploy the application"
  type        = string
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string

}

variable "k8s_deployment" {
  description = "Kubernetes deployment properties"
  type = object({
    metadata = object({
      name = string
    })
    app = string
  })

}