module "matrix_vpc" {
    source = "./src/matrix_vpc"
    
    vpc = {
      
      ### common
      aws_region = var.vpc.aws_region
      environment = var.vpc.environment
      cluster_name = var.vpc.cluster_name
      ### specifications
      vpc_name = var.vpc.vpc_name
      vpc_cidr_block = var.vpc.vpc_cidr_block
      vpc_public_subnets = var.vpc.vpc_public_subnets
      vpc_private_subnets = var.vpc.vpc_private_subnets
      vpc_enable_nat_gateway = var.vpc.vpc_enable_nat_gateway  
    }
}