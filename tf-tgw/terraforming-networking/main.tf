provider "aws" {
  access_key = ""
  secret_key = ""
  region     = var.region
}

terraform {
}

module "tgw" {
  source = "../modules/tgw"
  create_transit_gateway          = var.create_transit_gateway
  create_transit_gateway_route_table  = var.create_transit_gateway_route_table
  aws_ec2_transit_gateway_route_table = var.aws_ec2_transit_gateway_route_table
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  auto_accept_shared_attachments  = var.auto_accept_shared_attachments
  dns_support                     = var.dns_support
  transit_gateway_cidr_blocks     = var.transit_gateway_cidr_blocks
  vpn_ecmp_support                = var.vpn_ecmp_support
  amazon_side_asn				          = var.amazon_side_asn
}
module "tgw-attachment" {

  source = "../modules/tgw-attachments"
  create_transit_gateway = var.create_transit_gateway
  create_transit_gateway_vpc_attachment = var.create_transit_gateway_vpc_attachment
  vpc_attachment_dns_support         = var.vpc_attachment_dns_support
  vpc_attachment_ipv6_support        = var.vpc_attachment_ipv6_support
  attachments = {
    "vpc1" = {
      name                           = var.transit-gateway-attachment-name
      vpc_id                         = var.vpc1_id
      transit_gateway_id             = module.tgw.transit-gateway-id
      subnet_ids                     = var.subnet1_ids
      transit_gateway_route_table_id = module.tgw.transit-gateway-rt-id
    }
  }

}

