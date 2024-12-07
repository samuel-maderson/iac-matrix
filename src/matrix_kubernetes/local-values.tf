# Define Local Values in Terraform
locals {
  owners = var.kubernetes.business_divsion
  environment = var.kubernetes.environment
  name = "${var.kubernetes.business_divsion}-${var.kubernetes.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.kubernetes.cluster_name}"  
} 