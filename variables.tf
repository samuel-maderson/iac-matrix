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

