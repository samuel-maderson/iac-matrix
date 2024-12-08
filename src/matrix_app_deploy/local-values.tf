# Define Local Values in Terraform
locals {
  environment = var.app_deploy.environment
  name = "${var.app_deploy.environment}"
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.app_deploy.cluster_name}"  
} 