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
}