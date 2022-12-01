variable "aws_side_bgp_asn" {
  description = "BPG ASN used on the AWS side"
  default     = 64514
}

variable "transit_gateway_id" {
  description = "ID of the pre-existing Transit Gateway to attach the DX to"
}

variable "transit_gateway_ip_prefixes" {
  description = "Subnets attached to the Transit Gateway to allow to route through the DX conn"
  default = [
    ""
  ]
}

variable "primary_direct_connect_connection_id" {
  description = "ID of the DX Connection created by the DX provider"
  default     = ""
}

variable "secondary_direct_connect_connection_id" {
  description = "ID of the DX Connection created by the DX provider"
  default     = ""
}

variable "vlan" {
  description = "The VLAN used by the DX Connection. Provided by DX provider"
  default     = ""
}

variable "dx_gateway_bgp_asn" {
  description = "BGP ASN used by the DX Gateway"
  default     = ""
}

variable "primary_dx_amazon_address" {
  description = "IP Address of the Amazon side of the DX connection"
  default     = ""
}

variable "primary_dx_customer_address" {
  description = "IP Address of the customer side of the DX connection"
  default     = ""
}

variable "primary_dx_bgp_auth_key" {
  description = "Key used for the BGP authentication"
  default     = ""
}

variable "secondary_dx_amazon_address" {
  description = "IP Address of the Amazon side of the DX connection"
  default     = ""
}

variable "secondary_dx_customer_address" {
  description = "IP Address of the customer side of the DX connection"
  default     = ""
}

variable "secondary_dx_bgp_auth_key" {
  description = "Key used for the BGP authentication"
  default     = ""
}

variable "create_dx_gateway" {
  description = "Key used for the BGP authentication"
  default     = ""
}

variable "create_dx_private_vif" {
  description = "Create a DX Private virtual Interface"
  default     = ""
}

variable "associate_dx_gateway" {
  description = "Create a DX Private virtual Interface"
  default     = ""
}


