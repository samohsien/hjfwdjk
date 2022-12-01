variable "vpc_id" {
  description = "The ID of the associated VPC."
  type =  string
  default = ""
}

variable "region" {
  description = "The ID of the associated VPC."
  type =  string
  default = "us-east-1"
}
variable "ingress_rules" {
  default     = {
    "ingress rule 1" = {
      "description" = "For HTTP"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },
    "ingress rule 2" = {
      "description" = "For SSH"
      "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type = map(object({
  description = string
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
}))
 
}

variable "egress_rules" {
  default     = {
    "egress rule 1" = {
      "description" = "For HTTP"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },
    "egress rule 2" = {
      "description" = "For SSH"
      "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type = map(object({
  description = string
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
}))
 
}
