# Terraform AWS Provider Block
provider "aws" {
  region = "us-east-1"
}

data "aws_eks_cluster" "cluster" {
  name = var.app_deploy.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.app_deploy.cluster_id
}

# Terraform Kubernetes Provider
provider "kubernetes" {
  host = var.app_deploy.cluster_endpoint 
  cluster_ca_certificate = base64decode(var.app_deploy.cluster_certificate_authority_data)
  token = data.aws_eks_cluster_auth.cluster.token
}