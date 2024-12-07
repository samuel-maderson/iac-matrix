variable "eks" {
  type = object({
    ### common
    aws_region = string
    environment = string
    ### specifications
    cluster_name = string
    cluster_service_ipv4_cidr = string
    cluster_version = string
    cluster_endpoint_private_access = bool
    cluster_endpoint_public_access = bool
    cluster_endpoint_public_access_cidrs = list(string)
    private_subnets = list(string)
  })
}