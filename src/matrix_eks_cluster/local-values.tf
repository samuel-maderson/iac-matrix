# Define Local Values in Terraform
locals {
  owners = var.eks.business_divsion
  environment = var.eks.environment
  name = "${var.eks.business_divsion}-${var.eks.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.eks.cluster_name}"  
} 