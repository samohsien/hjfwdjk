# ---tgw resource creation--------
resource "aws_ec2_transit_gateway" "tgw" {
  count =  var.create_transit_gateway ? 1 : 0

  description                     = "ghe hosted transit gateway"
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  amazon_side_asn                 = var.amazon_side_asn
  auto_accept_shared_attachments  = var.auto_accept_shared_attachments
  dns_support                     = var.vpc_attachment_dns_support
  #multicast_support               = var.multicast_support
  transit_gateway_cidr_blocks     = var.transit_gateway_cidr_blocks
  vpn_ecmp_support                = var.vpn_ecmp_support
  tags                            = merge({ "Name" = var.tgw_name}, var.tags)
}


resource "aws_ec2_transit_gateway_route_table" "default" {
  count =  (var.aws_ec2_transit_gateway_route_table && var.create_transit_gateway) ? 1 : 0
  transit_gateway_id =   aws_ec2_transit_gateway.tgw[0].id
  tags                            = merge({ "Name" = var.tgw_routetable_name }, var.tags)

}


