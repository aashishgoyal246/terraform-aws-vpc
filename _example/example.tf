provider "aws" {
  region = "ap-south-1"  
}

module "vpc" {
  source = "../"

  name        = "vpc"
  application = "aashish"
  environment = "test"
  label_order = ["environment", "application", "name"]

  enabled                          = true
  cidr_block                       = ["10.10.0.0/16", "10.20.0.0/16"]
  assign_generated_ipv6_cidr_block = true
}