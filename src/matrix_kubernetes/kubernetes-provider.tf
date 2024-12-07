# Datasource: 
data "aws_eks_cluster_auth" "cluster" {
  name = var.kubernetes.cluster_id
}

# Terraform Kubernetes Provider
provider "kubernetes" {
  host = var.kubernetes.cluster_endpoint
  #cluster_ca_certificate = base64decode(aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  cluster_ca_certificate = base64decode(var.kubernetes.cluster_certificate_authority_data)
  token = data.aws_eks_cluster_auth.cluster.token
}