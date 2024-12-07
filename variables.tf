variable "vpc" {
  type = object({
    ### common
    aws_region = string
    environment = string
    cluster_name = string
    
    ### specifications
    vpc_name = string
    vpc_cidr_block = string
    //vpc_availability_zones = list(string)
    vpc_public_subnets = list(string)
    vpc_private_subnets = list(string)
    vpc_enable_nat_gateway = bool
  })
}

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
    ### values from module: ng_vpc
    private_subnets = list(string)
  })
}


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