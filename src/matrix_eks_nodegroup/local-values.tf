# Define Local Values in Terraform
locals {
  environment = var.eks_nodegroup.environment
  name = var.eks_nodegroup.environment
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.eks_nodegroup.cluster_name}"  
} 