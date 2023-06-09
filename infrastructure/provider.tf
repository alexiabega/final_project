provider "aws" {
  region     = "eu-north-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "group2-final-project"

    workspaces {
      name = "final_project"
    }
  }
}