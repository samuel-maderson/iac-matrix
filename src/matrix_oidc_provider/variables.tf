variable "ng_oidc_provider" {
  type = object({
    ### common
    aws_region = string
    environment = string
    business_divsion = string
    cluster_name = string
    ### specifications
    cluster_oidc_issuer_url = string
    eks_oidc_root_ca_thumbprint = string
  })
}