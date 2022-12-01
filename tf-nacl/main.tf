provider "aws" {
  access_key = ""
  secret_key = ""
  region     = var.region

}

# Define inbound and outbound NACL rules and apply to Subnet(s):

resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id
  subnet_ids = var.subnets

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port        = lookup(ingress.value, "from_port", null)
      to_port          = lookup(ingress.value, "to_port", null)
      protocol         = lookup(ingress.value, "protocol", null)
      cidr_block      = lookup(ingress.value, "cidr_blocks", null)
      rule_no          = lookup(ingress.value, "rule_no", null)
      action           = lookup(ingress.value, "action", null)
    }
  }


  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port        = lookup(egress.value, "from_port", null)
      to_port          = lookup(egress.value, "to_port", null)
      protocol         = lookup(egress.value, "protocol", null)
      cidr_block      = lookup(egress.value, "cidr_blocks", null)
      rule_no          = lookup(egress.value, "rule_no", null)
      action           = lookup(egress.value, "action", null)
    }
  }

}
