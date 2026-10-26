output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.practice.id
}

output "ec2_private_ip" {
  description = "EC2 private IP address"
  value       = aws_instance.practice.private_ip
}

output "ec2_instance_type" {
  description = "EC2 instance type"
  value       = aws_instance.practice.instance_type
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.ec2_sg.id
}

output "terraform_state_location" {
  description = "S3 remote state location"
  value       = "s3://ec2-sang-testing/ec2/terraform.tfstate"
}
