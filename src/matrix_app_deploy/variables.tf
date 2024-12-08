variable "app_deploy" {
    type = object({
      aws_region = string
      environment = string
      cluster_name = string
      cluster_endpoint = string
      cluster_id = string
      cluster_certificate_authority_data = string
    })
}