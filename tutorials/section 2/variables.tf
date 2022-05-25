variable "sg_cidr" {
  default     = "0.0.0.0/0"
  description = "CIDR Block for security groups"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "instance type for all instnaces"
}

variable "AWS_ACCESS_KEY" {
  type        = string
  description = "Pulls env var for aws access key"
}

variable "AWS_SECRET" {
  type        = string
  description = "Pulls env var for aws secret"
}

variable "test_map" {
  type        = map(any)
  description = "Var for getting map attributes"
}

variable "region" {
  type        = string
  description = "Region specification for deployment"
}

variable "instance_count" {
  type        = number
  description = "Amount of instances to create"
}

variable "deploy_dev" {
  type        = bool
  description = "Bool for determining to deploy in dev or prod environment"
}

variable "key_name" {
  type        = string
  description = "key name for the aws key pair"
}