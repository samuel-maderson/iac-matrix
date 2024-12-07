# Datasource: EKS Cluster Auth 
data "aws_eks_cluster_auth" "cluster" {
  name = var.externaldns.cluster_id
}

# HELM Provider
provider "helm" {
  kubernetes {
    host                   = var.externaldns.cluster_endpoint
    cluster_ca_certificate = base64decode(var.externaldns.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}