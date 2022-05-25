locals {
  common_tags_prod = {
    Owner       = "BG-PROD"
    Environment = "PROD"
  }
}

resource "aws_instance" "TestInstanceProd" {
  ami             = data.aws_ami.instance_ami.id
  instance_type   = var.test_map.instances[var.region]
  security_groups = ["bg_rules"]
  count           = var.deploy_dev == false ? var.instance_count : 0

  tags = merge({
    Name = "TestInstanceProd-${count.index}"
  }, local.common_tags_prod)
}

resource "aws_eip" "TestInstanceProdEIP" {
  vpc   = true
  count = var.deploy_dev == false ? var.instance_count : 0
}

resource "aws_eip_association" "lb_association-prod" {
  instance_id   = aws_instance.TestInstanceProd[count.index].id
  allocation_id = aws_eip.TestInstanceProdEIP[count.index].id
  count         = var.deploy_dev == false ? var.instance_count : 0
}