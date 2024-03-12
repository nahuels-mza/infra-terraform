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
  source         = "./modules/ec2"
  security_group = module.sg.sg_name
}

module "sg" {
  source = "./modules/sg"
}
module "s3" {
  source = "./modules/s3"
}

module "vpc" {
  source = "./modules/vpc"
}
