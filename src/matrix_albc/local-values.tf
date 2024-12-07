# Define Local Values in Terraform
locals {
  owners = var.albc.business_divsion
  environment = var.albc.environment
  name = "${var.albc.business_divsion}-${var.albc.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.albc.cluster_name}"  
} 