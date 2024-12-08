# Define Local Values in Terraform
locals {
  environment = var.eks_albc.environment
  name = "${var.eks_albc.environment}"
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.eks_albc.cluster_name}"  
} 