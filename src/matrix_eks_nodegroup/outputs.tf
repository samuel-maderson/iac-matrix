output "eks_nodegroup_role_arn" {
  description = "IAM Role nodegroup arn"
  value = aws_iam_role.eks_nodegroup_role.arn
}