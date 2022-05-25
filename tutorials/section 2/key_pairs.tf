resource "tls_private_key" "aws" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tutorial" {
  key_name   = var.key_name
  public_key = tls_private_key.aws.public_key_openssh
}