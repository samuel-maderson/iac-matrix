# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {
}

# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  #version = "4.0.1"
  version = "5.4.0"    
  
  # VPC Basic Details
  name = local.eks_cluster_name
  cidr = var.vpc.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc.vpc_public_subnets
  private_subnets = var.vpc.vpc_private_subnets  

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc.vpc_enable_nat_gateway 
  #single_nat_gateway = var.vpc.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  
  tags = local.common_tags
  vpc_tags = local.common_tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"        
  }
  private_subnet_tags = {
    Type = "private-subnets"
    "kubernetes.io/role/internal-elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"    
  }

  # database_subnet_tags = {
  #   Type = "database-subnets"
  # }
  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true  
}