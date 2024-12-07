# Define Local Values in Terraform
locals {
  owners = var.ng_oidc_provider.business_divsion
  environment = var.ng_oidc_provider.environment
  name = "${var.ng_oidc_provider.business_divsion}-${var.ng_oidc_provider.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.ng_oidc_provider.cluster_name}"  
} 