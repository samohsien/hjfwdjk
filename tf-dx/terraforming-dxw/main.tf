provider "aws" {
  access_key = ""
  secret_key = ""
  region     = var.region

}

terraform {
}


module "dxw" {
  source = "../modules/dxw"

  create_dx_gateway = var.create_dx_gateway

  dx_gateway_bgp_asn = var.aws_side_bgp_asn
  transit_gateway_id =var.transit_gateway_id

}

module "vif" {
  source = "../modules/vif"

  create_dx_private_vif = var.create_dx_private_vif

  dx_gateway_id = module.dxw.dx_gtwyconnection_id
  transit_gateway_id =var.transit_gateway_id
  vlan = var.vlan
  dx_private_hosted_vif_owner_account_id = var.dx_private_hosted_vif_owner_account_id
  primary_direct_connect_connection_id = var.primary_direct_connect_connection_id
  dx_gateway_bgp_asn             = var.dx_gateway_bgp_asn
  primary_dx_amazon_address   = var.primary_dx_amazon_address  
  primary_dx_customer_address = var.primary_dx_customer_address
  primary_dx_bgp_auth_key   = var.primary_dx_bgp_auth_key
  secondary_dx_amazon_address   = var.secondary_dx_amazon_address  
  secondary_dx_customer_address = var.secondary_dx_customer_address
  secondary_dx_bgp_auth_key   = var.secondary_dx_bgp_auth_key  


}
