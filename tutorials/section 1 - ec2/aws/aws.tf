terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.0"
        }
    }
}

provider "aws" {
    region = "us-east-2"
    access_key = "AKIAVCDUXIHZZIUNCHFK"
    secret_key = "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"
}

resource "aws_instance" "TestInstance" {
    ami             = "ami-0661cd3308ec33aaa"
    instance_type   = "t2.micro"
    security_groups = ["https_ssh"]

    tags = {
        Name = "TestInstance"
    }
}