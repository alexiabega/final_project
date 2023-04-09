provider "aws" {
    region = "eu-north-1"
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

terraform {
  required_providers {
    aws = {
        sousource = "hashicorp/aws"
        versversion = "~> 4.0"
    }
  }
}