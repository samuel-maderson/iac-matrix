# Datasource: EKS Cluster Auth 
data "aws_eks_cluster_auth" "cluster" {
  name = var.albc.cluster_id
}

# HELM Provider
provider "helm" {
  kubernetes {
    host                   = var.albc.cluster_endpoint
    cluster_ca_certificate = base64decode(var.albc.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token

  }
}