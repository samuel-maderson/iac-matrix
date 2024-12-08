# Define Local Values in Terraform
locals {
  environment = var.externaldns.environment
  name = "${var.externaldns.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.externaldns.cluster_name}"  
} 