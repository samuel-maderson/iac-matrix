# Define Local Values in Terraform
locals {
  owners = var.app_deploy.business_divsion
  environment = var.app_deploy.environment
  name = "${var.app_deploy.business_divsion}-${var.app_deploy.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.app_deploy.cluster_name}"  
} 