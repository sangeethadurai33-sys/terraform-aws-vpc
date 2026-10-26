# Look up the existing VPC
data "aws_vpc" "existing" {
  id = var.vpc_id
}

# Find subnets in the existing VPC
data "aws_subnets" "existing" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }
}

# Find the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create a Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "terraform-practice-ec2-sg"
  description = "Security group for Terraform EC2 practice"
  vpc_id      = data.aws_vpc.existing.id

  # No inbound access is allowed
  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "terraform-practice-ec2-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Create an EC2 instance
resource "aws_instance" "practice" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.existing.ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name        = "terraform-practice-ec2"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
