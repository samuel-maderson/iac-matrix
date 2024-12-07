# Define Local Values in Terraform
locals {
  environment = var.eks.environment
  name = var.eks.environment
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.eks.cluster_name}"  
} 