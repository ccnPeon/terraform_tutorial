locals {
  common_tags_dev = {
    Owner       = "BG-DEV"
    Environment = "DEV"
  }
}

resource "aws_instance" "TestInstanceDev" {
  ami             = data.aws_ami.instance_ami.id
  instance_type   = var.test_map.instances[var.region]
  security_groups = ["bg_rules"]
  count           = var.deploy_dev == true ? var.instance_count : 0
  key_name        = var.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = tls_private_key.aws.private_key_pem
    }
  }


  tags = merge({
    Name = "TestInstanceDev-${count.index}"
  }, local.common_tags_dev)

}

resource "aws_eip" "TestInstanceDevEIP" {
  vpc   = true
  count = var.deploy_dev == true ? var.instance_count : 0
}

resource "aws_eip_association" "lb_association-dev" {
  instance_id   = aws_instance.TestInstanceDev[count.index].id
  allocation_id = aws_eip.TestInstanceDevEIP[count.index].id
  count         = var.deploy_dev == true ? var.instance_count : 0
}