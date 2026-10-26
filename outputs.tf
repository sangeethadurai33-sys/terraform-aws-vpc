output "iam_role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.lambda_role.name
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.lambda_role.arn
}

output "iam_policy_name" {
  description = "Name of the IAM policy"
  value       = aws_iam_policy.lambda_logs_policy.name
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy"
  value       = aws_iam_policy.lambda_logs_policy.arn
}
