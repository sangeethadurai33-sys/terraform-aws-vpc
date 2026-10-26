variable "aws_region" {
  description = "AWS region where Terraform will operate"
  type        = string
  default     = "ap-south-1"
}

variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "terraform-practice-lambda-role"
}

variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "terraform-practice-lambda-logs-policy"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "Dev"
}
