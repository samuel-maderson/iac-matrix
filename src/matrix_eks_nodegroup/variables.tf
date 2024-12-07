
variable "eks_nodegroup" {
  type = object({
    ### common
    aws_region = string
    environment = string
    business_divsion = string
    cluster_name = string
    ### specifications
    cluster_version = string 
    private_subnets = list(string)
  })
}