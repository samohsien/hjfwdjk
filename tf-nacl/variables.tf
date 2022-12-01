variable "vpc_id" {
  description = "The ID of the associated VPC."
  type        = string
  default = ""
}
variable "region" {
  description = "The region associated VPC."
  type        = string
  default = "us-east-1"
}


#nacl_name = var.nacl_name

variable "subnets" {
  description = "A list of subnet IDs to apply the ACL to."
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  default     = {
    "ingress rule 1" = {
      "description" = "For HTTP"
      "rule_no"     = 100
      "from_port"   = 22
      "to_port"     = 22
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    },
    "ingress rule 2" = {
      "description" = "For SSH"
      "rule_no"     = 110
      "from_port"   = 80
      "to_port"     = 80
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    },
    "ingress rule 3" = {
      "description" = "For SSH"
      "rule_no"     = 120
      "from_port"   = 443
      "to_port"     = 443
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    },
    "ingress rule 4" = {
      "description" = "For SSH"
      "rule_no"     = 130
      "from_port"   = 1024
      "to_port"     = 65535
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    }
  }
  type = map(object({
  description = string
  rule_no     = number
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = string
  action      = string
}))

}

variable "egress_rules" {
  default     = {
    "egress rule 1" = {
      "description" = "For HTTP"
      "rule_no"     = 100
      "from_port"   = 22
      "to_port"     = 22
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    },
    "egress rule 2" = {
      "description" = "For SSH"
      "rule_no"     = 110
      "from_port"   = 80
      "to_port"     = 80
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    },
    "egress rule 3" = {
      "description" = "For SSH"
      "rule_no"     = 120
      "from_port"   = 443
      "to_port"     = 443
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    },
    "egress rule 4" = {
      "description" = "For SSH"
      "rule_no"     = 130
      "from_port"   = 1024
      "to_port"     = 65535
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
      "action"      = "allow"
    }
  }
  type = map(object({
  description = string
  rule_no     = number
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = string
  action      = string
}))

}
