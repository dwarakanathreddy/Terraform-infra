terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region="us-east-1"
  profile="default"

}

resource "aws_s3_bucket" "example" {
  bucket = "dwarak-tf-test-bucket-github"

  tags = {
    Name        = "Dev bucket / Test bucket "
    Environment = "Dev"
  }
}