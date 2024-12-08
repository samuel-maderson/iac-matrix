# Define Local Values in Terraform
locals {
  environment = var.eks_oidc_provider.environment
  name = "${var.eks_oidc_provider.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.eks_oidc_provider.cluster_name}"  
} 