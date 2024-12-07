
variable "eks_nodegroup" {
  type = object({
    ### common
    aws_region = string
    environment = string
    cluster_name = string
    ### specifications
    cluster_version = string 
    private_subnets = list(string)
    desired_size = number
    max_size = number
    min_size = number
  })
}