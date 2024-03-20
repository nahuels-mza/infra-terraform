provider "aws" {
  region = "us-west-1"

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "ec2" {
  source           = "./modules/ec2"
  security_group   = module.sg.security_group_id
  internet_gateway = module.vpc.internet_gateway_id
  subnet_id        = module.vpc.subnet_id
}

# module "s3" {
#   source = "./modules/s3"
# }

module "vpc" {
  source = "./modules/vpc"
}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
