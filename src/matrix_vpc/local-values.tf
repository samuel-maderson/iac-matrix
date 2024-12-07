# Define Local Values in Terraform
locals {
  environment = var.vpc.environment
  name = var.vpc.environment
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.vpc.cluster_name}"  
} 