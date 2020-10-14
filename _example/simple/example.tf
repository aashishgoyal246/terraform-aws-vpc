provider "aws" {
  region = "us-east-1"  
}

module "vpc" {
  source = "../../"

  name        = "vpc"
  application = "aashish"
  environment = "test"
  label_order = ["environment", "application", "name"]

  enabled    = true
  cidr_block = "10.10.0.0/16"
}