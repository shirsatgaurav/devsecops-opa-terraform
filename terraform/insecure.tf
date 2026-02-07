provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "devsecops-demo-bucket-123"
   acl    = "public-read"
}

resource "aws_security_group" "open_sg" {
  name = "open-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
