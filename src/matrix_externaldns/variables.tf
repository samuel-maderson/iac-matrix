
variable "externaldns" {
  type = object({
    ### common
    aws_region = string
    environment = string
    business_divsion = string
    cluster_name = string
    cluster_id = string
    cluster_endpoint = string
    cluster_certificate_authority_data = string
    aws_iam_openid_connect_provider_arn = string
    aws_iam_openid_connect_provider_extract_from_arn = string
  })
}