terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # Adding backend as S3 for remote state Storage
  backend "s3" {
    bucket = "concourse-test-patrik"
    key = "test/terraform.tfstate"
    region = "us-east-1"
 }
}

resource "aws_vpc" "test_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "test_vpc"
  }
}
