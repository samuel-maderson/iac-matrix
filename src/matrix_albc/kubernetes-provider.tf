# Terraform Kubernetes Provider
provider "kubernetes" {
  host = var.albc.cluster_endpoint 
  cluster_ca_certificate = base64decode(var.albc.cluster_certificate_authority_data)
  token = data.aws_eks_cluster_auth.cluster.token
}