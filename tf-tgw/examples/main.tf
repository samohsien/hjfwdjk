provider "aws" {
  access_key = "AKIAW3RF33LHNGKDVXCQ"
  secret_key = "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"
  region     = "us-east-1"

}

terraform {
}



module "transit-gateway" {
 source = "../../"
 create_transit_gateway = var.create_transit_gateway 
 amazon_side_asn = var.amazon_side_asn
 auto_accept_shared_attachments =  var.auto_accept_shared_attachments
 dns_support = var.dns_support
 multicast_support = var.multicast_support
 transit_gateway_cidr_blocks = var.transit_gateway_cidr_blocks
 vpn_ecmp_support = var.vpn_ecmp_support

# ---------------- AWS TRANSIT GATEWAY ----------------
resource "aws_ec2_transit_gateway" "tgw" {
  count =  (var.create_transit_gateway && local.create_tgw) ? 1 : 0

  description                     = "Transit_Gateway-${var.identifier}"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  amazon_side_asn                 = try(var.transit_gateway_attributes.amazon_side_asn, 64512)
  auto_accept_shared_attachments  = try(var.transit_gateway_attributes.auto_accept_shared_attachments, "disable")
  dns_support                     = try(var.transit_gateway_attributes.dns_support, "enable")
  multicast_support               = try(var.transit_gateway_attributes.multicast_support, "disable")
  transit_gateway_cidr_blocks     = try(var.transit_gateway_attributes.transit_gateway_cidr_blocks, [])
  vpn_ecmp_support                = try(var.transit_gateway_attributes.vpn_ecmp_support, "enable")

  tags = merge({
    Name = try(var.transit_gateway_attributes.name, "tgw-${var.identifier}")
  }, try(var.transit_gateway_attributes.tags, {}))
}



resource "aws_ec2_transit_gateway_route_table" "default" {

#  for_each = var.vpc_ids
  transit_gateway_id = local.transit_gateway_id

}

resource "aws_ec2_transit_gateway_vpc_attachment" "default" {
#  for_each = var.vpc_ids
  transit_gateway_id     = local.transit_gateway_id
  vpc_id                 = var.vpc_id
  subnet_ids             = var.subnet_ids
  appliance_mode_support = var.vpc_attachment_appliance_mode_support
  dns_support            = var.vpc_attachment_dns_support
  ipv6_support           = var.vpc_attachment_ipv6_support
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
#tags                   = module.this.tags
  }


resource "aws_ec2_transit_gateway_route_table_association" "this" {
#  for_each                       = var.attachments
  #transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.default[each.key].id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.default.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default.id
}

