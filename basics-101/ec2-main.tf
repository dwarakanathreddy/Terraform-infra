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

resource "aws_instance" "web" {

ami=data.aws_ami.ec2_ami.id
instance_type = "t2.micro"
count = 1
tags = {
  "name" ="web-${count.index}" 
}
  
}

data "aws_ami" "ec2_ami" {
  most_recent = true
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}