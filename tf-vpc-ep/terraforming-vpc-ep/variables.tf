variable "naming_pattern" {
  description = "The naming pattern to apply for the name of the resource vpc_endpoint and security_group. Must contains 2 %s"
  type        = string
  default     = "test-env-%s-%s"
}

variable "region" {
  description = "The AWS Region Id"
  type        = string
  default     = "us-east-1"
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




variable "vpc_id" {
  description = "The ID of the associated VPC."
  type =  string
  default = ""
}

variable "subnet_ids" {
  description = "The Ids of the associated subnets"
  type = list(string)
  default = [""]
}

variable "sec_grp_ids" {
  description = "The Ids of the associated security_groups"
  type = list(string)
  default = [""]
}

variable "private_backend_subnets_cidrs" {
  description = "list of private subnet cidrs"
  type = list(string)
  default = [""]
}

variable "inbound_ports" {
  description = "port Number"
  type = list(string)
  default = [ "" ]
}

variable "private_backend_subnets_rt_ids" {
  description = "list of private subnet route table ids"
  type = list(string)
  default = [""]
}
