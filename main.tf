#Module      : LABELS
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source = "git::https://github.com/aashishgoyal246/terraform-labels.git?ref=tags/0.12.0"

  name        = var.name
  application = var.application
  environment = var.environment
  enabled     = var.enabled
  label_order = var.label_order
  tags        = var.tags
}

#Module      : VPC
#Description : Terraform module to create VPC resource on AWS.
resource "aws_vpc" "default" {
  count = var.enabled ? 1 : 0

  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  tags                             = module.labels.tags
}

#Module      : INTERNET GATEWAY
#Description : Terraform module which creates Internet Gateway resources on AWS.
resource "aws_internet_gateway" "default" {
  count = var.enabled ? 1 : 0

  vpc_id = join("", aws_vpc.default.*.id)
  tags   = merge(
    module.labels.tags,
    {
      "Name" = format("%s-igw", module.labels.id)
    }
  )
}

#Module      : FLOW LOG
#Description : Provides a VPC/Subnet/ENI Flow Log to capture IP traffic for a
#              specific network interface, subnet, or VPC. Logs are sent to S3 Bucket.
resource "aws_flow_log" "vpc_flow_log" {
  count = var.enabled && var.flow_log_enabled ? 1 : 0

  traffic_type             = var.traffic_type
  log_destination_type     = var.log_destination_type
  log_destination          = var.log_destination_arn
  vpc_id                   = join("", aws_vpc.default.*.id)
  log_format               = var.log_format
  max_aggregation_interval = var.max_aggregation_interval
  tags                     = module.labels.tags
}