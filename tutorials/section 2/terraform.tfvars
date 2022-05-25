sg_cidr        = "0.0.0.0/0"
instance_type  = "t2.micro"
region         = "us-east-2"
instance_count = 1
test_map = {
  instances = {
    us-east-2 = "t2.micro"
    us-east-1 = "t3.micro"
  }
}
deploy_dev = true
key_name   = "tutorial"