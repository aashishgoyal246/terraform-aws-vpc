#Module      : LABELS
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `aashish`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "enabled" {
  type        = bool
  default     = false
  description = "Flag to control the vpc creation."
}

variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

#Module      : VPC
#Description : Terraform VPC module variables.
variable "cidr_block" {
  type        = list
  default     = []
  description = "CIDR for the VPC."
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "A tenancy option for instances launched into the VPC."
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "enable_classiclink" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable ClassicLink for the VPC."
}

variable "enable_classiclink_dns_support" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC."
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  default     = false
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
}

#Module      : FLOW LOG
#Description : Terraform flow log module variables.
variable "flow_log_enabled" {
  type        = bool
  default     = false
  description = "Whether flow log is enabled or not."
}

variable "traffic_type" {
  type        = string
  default     = ""
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL."
}

variable "log_destination_type" {
  type        = string
  default     = ""
  description = "The type of the logging destination. Valid values: cloud-watch-logs, s3. Default: cloud-watch-logs."
}

variable "log_destination_arn" {
  type        = string
  default     = ""
  description = "The ARN of the logging destination."
}

variable "log_format" {
  type        = string
  default     = ""
  description = "The fields to include in the flow log record, in the order in which they should appear."
}

variable "max_aggregation_interval" {
  type        = number
  default     = 600
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record."
}