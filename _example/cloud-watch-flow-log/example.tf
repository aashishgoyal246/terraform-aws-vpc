provider "aws" {
  region = "ap-south-1"  
}

module "iam_role" {
  source = "git::https://github.com/aashishgoyal246/terraform-aws-iam-role.git?ref=tags/0.12.1"

  name        = "iam-role"
  application = "aashish"
  environment = "test"
  label_order = ["environment", "application", "name"]

  enabled            = true
  assume_role_policy = data.aws_iam_policy_document.default.json
  policy_enabled     = true
  policy             = data.aws_iam_policy_document.iam_policy.json
}

data "aws_iam_policy_document" "default" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "iam_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
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
  iam_role_arn         = module.iam_role.arn
  log_destination_type = "cloud-watch-logs"
  log_destination      = 
}