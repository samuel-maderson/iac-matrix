# Define Local Values in Terraform
locals {
  owners = var.externaldns.business_divsion
  environment = var.externaldns.environment
  name = "${var.externaldns.business_divsion}-${var.externaldns.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.externaldns.cluster_name}"  
} 