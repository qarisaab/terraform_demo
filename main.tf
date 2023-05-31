terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "subnet_cidr" {
  description = "subet of cidr"
}







resource "aws_vpc" "main" {
  cidr_block = var.subnet_cidr
  tags = {
    "Name" : "Main terraform VPC"
  }
}

# subnet

resource "aws_subnet" "web" {
  vpc_id = aws_vpc.main.id
  cidr_block = "16.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name": "Websubnet"
  }
}