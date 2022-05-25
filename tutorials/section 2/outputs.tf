output "arns" {
  value = aws_iam_user.bg[*].arn
}