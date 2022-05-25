module "ec2_module" {
    source = "../../modules/ec2"
    count = 2
}