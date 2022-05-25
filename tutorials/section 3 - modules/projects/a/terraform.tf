terraform {
  required_version = ">= 1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }

    # vault = {
    #   source = "hashicorp/vault"
    # }

    tls = {
      source = "hashicorp/tls"
    }
  }

  backend "s3" {
    bucket = "bg-s3-bucket-demo"
    key    = "network/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "bg-terraform-lock"
  }
}