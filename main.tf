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

module "matrix_eks" {
  source = "./src/matrix_eks_cluster"

  eks = {

      ### common
      aws_region = var.eks.aws_region
      environment = var.eks.environment
      cluster_name = var.eks.cluster_name
      cluster_service_ipv4_cidr = var.eks.cluster_service_ipv4_cidr
      cluster_version = var.eks.cluster_version
      cluster_endpoint_private_access = var.eks.cluster_endpoint_private_access
      cluster_endpoint_public_access = var.eks.cluster_endpoint_public_access
      cluster_endpoint_public_access_cidrs = var.eks.cluster_endpoint_public_access_cidrs
      private_subnets = module.matrix_vpc.private_subnets
  }
} 