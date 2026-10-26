data "aws_vpc" "existing" {
  id = "vpc-052b3b9e8251cedd2"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = "Dev"
  }
}

