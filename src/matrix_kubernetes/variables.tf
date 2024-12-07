variable "kubernetes" {
    type = object({
      ### common
      aws_region = string
      environment = string
      business_divsion = string
      # specifications
      cluster_name = string
      cluster_endpoint = string
      cluster_id = string
      cluster_certificate_authority_data = string
      eks_nodegroup_role_arn = string
    })
}