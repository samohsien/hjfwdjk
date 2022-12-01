variable "region" {
  description = "The AWS Region Id"
  type        = string
}

variable "tags" {
  description = "a map of string containing the tags"
  type        = map(string)
  default     = {}
}


variable "naming_pattern" {
  description = "The naming pattern to apply for the name of the resource vpc_endpoint and security_group. Must contains 2 %s"
  type        = string
}

#Interface endpoint variables

variable "vpcendpoints_interfaces" {
  description = "a map of object for creating vpcendpoints type interface (s3,kms,sns,...)"
  type = list(object({
    id                    = string
    vpc_id                = string
    subnet_ids            = list(string)
    create_security_group = bool
    security_group_ids    = list(string)
    private_dns_enabled   = bool
    allowed_cidr_blocks   = list(string)
    inbound_ports         = list(string)
    tags                  = map(string)
  }))
  default = []
}

#Gateway endpoints variables
variable "vpcendpoints_gateways" {
  description = "a map of object for creating vpcendpoints type gateway (s3,dynamodb,...)"
  type = list(object({
    id              = string
    vpc_id          = string
    route_table_ids = list(string)
    tags            = map(string)
  }))
  default = []
}


variable "s3interface" {
  description = "The AWS Region Id"
  type        = bool
  default     = true
}
variable "kmsinterface" {
  description = "The AWS Region Id"
  type        = bool
  default     = false
}
variable "snsinterface" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
}
variable "dynamogtwy" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
}
variable "s3gtwy" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
}
variable "logsinterface" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
}
variable "monitinterface" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
}
variable "ec2interface" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
}
variable "ssminterface" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
}
