terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.5.0"
    }
  }
#   required_version = "1.4.6"
}

provider "aws" {
    region = var.aws_region
    # access_key = ${{access_key}}
    # secret_key = ${{secret_key}}
}