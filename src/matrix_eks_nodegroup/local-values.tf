# Define Local Values in Terraform
locals {
  owners = var.eks_nodegroup.business_divsion
  environment = var.eks_nodegroup.environment
  name = "${var.eks_nodegroup.business_divsion}-${var.eks_nodegroup.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.eks_nodegroup.cluster_name}"  
} 