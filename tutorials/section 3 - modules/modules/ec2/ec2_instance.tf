data "aws_ami" "instance_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*x86_64*"]
  }
}

resource "aws_instance" "ec2instance" {
  ami           = data.aws_ami.instance_ami.id
  instance_type = var.instance_type
}