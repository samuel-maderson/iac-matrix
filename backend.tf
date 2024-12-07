terraform {
   backend "s3" {
    bucket = "matrix-terraform-backend"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1" 
    dynamodb_table = "matrix-terraform-backend"    
  }
}