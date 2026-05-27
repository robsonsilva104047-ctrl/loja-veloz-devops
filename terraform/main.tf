terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "veloz_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "veloz-production-vpc"
  }
}

resource "aws_eks_cluster" "veloz_cluster" {
  name     = "veloz-kubernetes-prod"
  role_arn = "arn:aws:iam::123456789012:role/EKSClusterRole"

  vpc_config {
    subnet_ids = ["subnet-abc12345", "subnet-def12345"]
  }
}