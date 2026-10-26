# IAM Role
resource "aws_iam_role" "lambda_role" {
  name        = var.iam_role_name
  description = "Practice IAM role for AWS Lambda"

  # Trust policy: allows the Lambda service to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = var.iam_role_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# IAM Policy
resource "aws_iam_policy" "lambda_logs_policy" {
  name        = var.iam_policy_name
  description = "Allow Lambda to write logs to CloudWatch"

  # Permissions policy
  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]

        Resource = "arn:aws:logs:${var.aws_region}:*:log-group:/aws/lambda/*:*"
      }
    ]
  })

  tags = {
    Name        = var.iam_policy_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Attach IAM policy to IAM role
resource "aws_iam_role_policy_attachment" "lambda_logs_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_logs_policy.arn
}
