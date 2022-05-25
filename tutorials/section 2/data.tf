# data "vault_generic_secret" "aws_info" {
#   path = "aws/config/root"
# }

data "aws_ami" "instance_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*x86_64*"]
  }
}