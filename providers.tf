terraform {
  required_version = ">= 1.00.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
}
