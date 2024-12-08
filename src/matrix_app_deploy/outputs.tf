# Output the repository URL
output "repository_url" {
  value = aws_ecr_repository.myecr.repository_url
}

# Output the repository ARN
output "repository_arn" {
  value = aws_ecr_repository.myecr.arn
}