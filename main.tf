module "matrix_vpc" {
    source = "./src/matrix_vpc"
    
    vpc = {

      aws_region = var.vpc.aws_region
      environment = var.vpc.environment
      cluster_name = var.vpc.cluster_name
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

      aws_region = var.vpc.aws_region
      environment = var.vpc.environment
      cluster_name = var.eks.cluster_name
      cluster_service_ipv4_cidr = var.eks.cluster_service_ipv4_cidr
      cluster_version = var.eks.cluster_version
      cluster_endpoint_private_access = var.eks.cluster_endpoint_private_access
      cluster_endpoint_public_access = var.eks.cluster_endpoint_public_access
      cluster_endpoint_public_access_cidrs = var.eks.cluster_endpoint_public_access_cidrs
      private_subnets = module.matrix_vpc.private_subnets
  }

  depends_on = [ module.matrix_vpc ]
} 

module "matrix_eks_nodegroup" {
  source = "./src/matrix_eks_nodegroup"

  eks_nodegroup = {
    
      aws_region = var.vpc.aws_region
      environment = var.vpc.environment
      cluster_name = module.matrix_eks.cluster_name
      cluster_version = module.matrix_eks.cluster_version
      private_subnets = module.matrix_vpc.public_subnets
      desired_size = var.eks_nodegroup.desired_size
      max_size = var.eks_nodegroup.max_size
      min_size = var.eks_nodegroup.min_size
  }

  depends_on = [ module.matrix_eks ]
}

module "matrix_oidc_provider" {
  source = "./src/matrix_oidc_provider"

  eks_oidc_provider = {
    aws_region = var.vpc.aws_region
    environment = var.vpc.environment
    cluster_name = module.matrix_eks.cluster_name
    cluster_oidc_issuer_url = module.matrix_eks.cluster_oidc_issuer_url
    eks_oidc_root_ca_thumbprint = "f69fcb00bd04230745a986df5630a232d1a3e3c6"
  }

  depends_on = [ module.matrix_eks_nodegroup ]
}


# module "matrix_eks_albc" {
#   source = "./src/eks_albc"

#   eks = {

#       aws_region = var.vpc.aws_region
#       environment = var.vpc.environment
#       cluster_name = var.eks.cluster_name
#       aws_iam_openid_connect_provider_arn = var.eks_albc.aws_iam_openid_connect_provider_arn
#       aws_iam_openid_connect_provider_extract_from_arn = var.eks_albc.aws_iam_openid_connect_provider_extract_from_arn
#       cluster_certificate_authority_data = var.eks_albc.cluster_certificate_authority_data
#       cluster_endpoint = 
#       cluster_id = string
#       vpc_id = string
#   }
# }