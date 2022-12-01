resource "aws_dx_transit_virtual_interface" "dx-primary" {
  name = "transit-vif-primary"

  connection_id = var.primary_direct_connect_connection_id
  dx_gateway_id = var.dx_gtwyconnection_id

  vlan           = var.vlan
  address_family = "ipv4"
  bgp_asn        = var.dx_gateway_bgp_asn

  amazon_address   = var.primary_dx_amazon_address
  customer_address = var.primary_dx_customer_address
  bgp_auth_key     = var.primary_dx_bgp_auth_key
}

resource "aws_dx_transit_virtual_interface" "dx-secodary" {
  name = "transit-vif-secondary"

  connection_id = var.secondary_direct_connect_connection_id
  dx_gateway_id = var.dx_gtwyconnection_id

  vlan           = var.vlan
  address_family = "ipv4"
  bgp_asn        = var.dx_gateway_bgp_asn

  amazon_address   = var.secondary_dx_amazon_address
  customer_address = var.secondary_dx_customer_address
  bgp_auth_key     = var.secondary_dx_bgp_auth_key
}


resource "aws_dx_hosted_public_virtual_interface" "dx-public-primary" {
  connection_id = var.secondary_direct_connect_connection_id

  name           = var.pub_interface_name
  vlan           = var.vlan
  address_family = "ipv4"
  bgp_asn        = var.dx_gateway_bgp_asn
  owner_account_id = var.dx_private_hosted_vif_owner_account_id

  customer_address = "175.45.176.1/30"
  amazon_address   = "175.45.176.2/30"

  route_filter_prefixes = [
    "210.52.109.0/24",
    "175.45.176.0/22",
  ]
}


