resource "aws_ec2_transit_gateway_vpc_attachment" "default" {
  for_each               = var.attachments
  transit_gateway_id     = each.value.transit_gateway_id
  vpc_id                 = each.value.vpc_id
  subnet_ids             = each.value.subnet_ids
  dns_support            = var.vpc_attachment_dns_support
  ipv6_support           = var.vpc_attachment_ipv6_support
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
  tags                   = merge({ "Name" = var.tgw_routetable_name }, var.tags)
  }


resource "aws_ec2_transit_gateway_route_table_association" "default" {
  for_each                       = var.attachments
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.default[each.key].id
  #transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.default.id
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
}


