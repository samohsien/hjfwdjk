resource "aws_dx_gateway" "dx" {
  count = var.create_dx_gateway ? 1 : 0

  name            = "var.dxw_name"
  amazon_side_asn = var.aws_side_bgp_asn
}


data "aws_ec2_transit_gateway" "example" {
  id = var.transit_gateway_id
}

resource "aws_dx_gateway_association" "dx" {
  count = var.create_dx_gateway && var.associate_dx_gateway ? 1 : 0 
  dx_gateway_id         = aws_dx_gateway.dx[0].id
  associated_gateway_id = data.aws_ec2_transit_gateway.example.id

  allowed_prefixes = var.transit_gateway_ip_prefixes
}
