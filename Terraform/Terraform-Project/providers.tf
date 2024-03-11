terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
  backend "s3" {
    bucket = "nikhita-terraform-project-s3"
    region = "us-west-1"
    key    = "terraform-project/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-west-1"
}