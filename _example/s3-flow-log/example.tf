provider "aws" {
  region = "ap-south-1"  
}

module "vpc" {
  source = "../"

  name        = "vpc"
  application = "aashish"
  environment = "test"
  label_order = ["environment", "application", "name"]

  enabled    = true
  cidr_block = "10.10.0.0/16"

  flow_log_enabled     = true
  traffic_type         = "ALL"
  log_destination_type = "s3"
  log_destination      = 
}