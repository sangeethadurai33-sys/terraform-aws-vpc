output "vpc_id" {
  description = "ID of the created VPC"
  value       = data.aws_vpc.existing.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = data.aws_vpc.existing.cidr_block
}

output "s3_bucket_id" {
  description = "ID of the created S3 bucket"
  value       = aws_s3_bucket.my_bucket.id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.arn
}

