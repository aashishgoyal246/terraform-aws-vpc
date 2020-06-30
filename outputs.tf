#Module      : VPC
#Description : Output of resources created on AWS.
output "vpc_id" {
  value       = join("", aws_vpc.default.*.id)
  description = "The ID of the VPC."
}

output "vpc_arn" {
  value       = join("", aws_vpc.default.*.arn)
  description = "The ARN of the VPC."
}

output "vpc_cidr_block" {
  value       = join("", aws_vpc.default.*.cidr_block)
  description = "The CIDR block of the VPC."
}

output "vpc_ipv6_cidr_block" {
  value       = join("", aws_vpc.default.*.ipv6_cidr_block)
  description = "The IPv6 CIDR block."
}

#Module      : INTERNET GATEWAY
#Description : Output of resources created on AWS.
output "ig_id" {
  value       = join("", aws_internet_gateway.default.*.id)
  description = "The ID of the Internet Gateway."
}

output "ig_arn" {
  value       = join("", aws_internet_gateway.default.*.arn)
  description = "The ARN of the Internet Gateway."
}

#Module      : TAGS
#Description : Output of resources created on AWS.

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}