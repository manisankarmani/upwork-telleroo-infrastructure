terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.50.0"
    }
    docker = {
      source = "kreuzwerker/docker"
    }
  }

}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  default_tags {
    tags = {
      Name        = var.name
      environment = var.environment
    }
  }
}