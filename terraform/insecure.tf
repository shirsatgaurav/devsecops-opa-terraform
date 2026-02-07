provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "opa-secure-demo-bucket-12345"
  acl    = "private"

 server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_security_group" "secure_sg" {
  name = "secure-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["42.108.236.147/32"]
  }
}
