variable "eks_oidc_provider" {
  type = object({
    aws_region = string
    environment = string
    cluster_name = string
    cluster_oidc_issuer_url = string
    eks_oidc_root_ca_thumbprint = string
  })
}