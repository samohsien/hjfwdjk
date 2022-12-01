variable "ram_resource_share_enabled" {
  type        = bool
  default     = null
  description = "Whether to enable sharing the Transit Gateway with the Organization using Resource Access Manager (RAM)"
}

variable "ram_principal" {
  type        = string
  default     = ""
  description = <<-EOT
    DEPRECATED, please use ram_principals instead.

    The principal to associate with the resource share. Possible values are an
    AWS account ID, an Organization ARN, or an Organization Unit ARN.
  EOT
}

variable "ram_principals" {
  type        = list(string)
  default     = []
  description = <<-EOT
    A list of principals to associate with the resource share. Possible values
    are:

    * AWS account ID
    * Organization ARN
    * Organization Unit ARN

    If this (and var.ram_principal) is not provided and
    `ram_resource_share_enabled` is `true`, the Organization ARN will be used.
  EOT
}

variable "auto_accept_shared_attachments" {
  type        = string
  default     = ""
  description = "Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. Default value: `disable`"
}

variable "default_route_table_association" {
  type        = string
  default     = ""
  description = "Whether resource attachments are automatically associated with the default association route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "multicast_support" {
  type        = string
  default     = ""
  description = "Whether resource attachments are automatically associated with the default association route table. Valid values: `disable`, `enable`. Default value: `enable`"
}


variable "default_route_table_propagation" {
  type        = string
  default     = ""
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "dns_support" {
  type        = string
  default     = ""
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "vpn_ecmp_support" {
  type        = string
  default     = ""
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "allow_external_principals" {
  type        = bool
  default     = null
  description = "Indicates whether principals outside your organization can be associated with a resource share"
}

variable "vpc_attachment_appliance_mode_support" {
  type        = string
  default     = ""
  description = "Whether Appliance Mode support is enabled. If enabled, a traffic flow between a source and destination uses the same Availability Zone for the VPC attachment for the lifetime of that flow. Valid values: `disable`, `enable`"
}

variable "vpc_attachment_dns_support" {
  type        = string
  default     = "enable"
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}

variable "vpc_attachment_ipv6_support" {
  type        = string
  default     = ""
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: `disable`, `enable`. Default value: `enable`"
}


variable "existing_transit_gateway_id" {
  type        = string
  default     = null
  description = "Existing Transit Gateway ID. If provided, the module will not create a Transit Gateway but instead will use the existing one"
}

variable "existing_transit_gateway_route_table_id" {
  type        = string
  default     = null
  description = "Existing Transit Gateway Route Table ID. If provided, the module will not create a Transit Gateway Route Table but instead will use the existing one"
}

variable "create_transit_gateway" {
  type        = bool
  default     = null
  description = "Whether to create a Transit Gateway. If set to `false`, an existing Transit Gateway ID must be provided in the variable `existing_transit_gateway_id`"
}

variable "create_transit_gateway_route_table" {
  type        = bool
  default     = null
  description = "Whether to create a Transit Gateway Route Table. If set to `false`, an existing Transit Gateway Route Table ID must be provided in the variable `existing_transit_gateway_route_table_id`"
}

variable "create_transit_gateway_vpc_attachment" {
  type        = bool
  default     = null
  description = "Whether to create Transit Gateway VPC Attachments"
}

variable "create_transit_gateway_route_table_association_and_propagation" {
  type        = bool
  default     = null
  description = "Whether to create Transit Gateway Route Table associations and propagations"
}


variable "transit_gateway_cidr_blocks" {
  type        = list(string)
  default     = null
  description = <<-EOT
    The list of associated CIDR blocks. It can contain up to 1 IPv4 CIDR block
    of size up to /24 and up to one IPv6 CIDR block of size up to /64. The IPv4
    block must not be from range 169.254.0.0/16.
  EOT
}

variable "transit_gateway_description" {
  type        = string
  default     = ""
  description = "Transit Gateway description. If not provided, one will be automatically generated."
}



/********
* Tags *
*********/

variable "tags" {
  type        = map
  default     = {}
  description = "Key/value tags to assign to all AWS resources"
}

# AWS Transit Gateway Information
variable "transit_gateway_id" {
  type        = string
  description = "Transit Gateway ID. **If you specify this value, transit_gateway_attributes can't be set**."
  default     = null
}

variable "vpc1_id" {
  type        = string
  description = "Transit Gateway ID. **If you specify this value, transit_gateway_attributes can't be set**."
  default     = ""
}

variable "subnet1_ids" {
  type        = set(string)
  description = "Transit Gateway ID. **If you specify this value, transit_gateway_attributes can't be set**."
  default     = [""]
}


# Module identifier


variable "transit_gateway_default_route_table_association" {
  description = "Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: `true`"
  type        = bool
  default     = null
}

variable "transit_gateway_default_route_table_propagation" {
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways.  Default value: `true`"
  type        = bool
  default     = null
}

variable "aws_ec2_transit_gateway_route_table" {
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways.  Default value: `true`"
  type        = bool
  default     = null
}


variable "attachments" {
  description = "A map of transit-gateway attachments objects"
  type = map(object({
    name                           = string
    vpc_id                         = string
    transit_gateway_id             = string
    subnet_ids                     = list(string)
    transit_gateway_route_table_id = string
  }))
  default = null
}


variable "tgw_name" {
  type        = string
  default     = ""
  description = "Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. Default value: `disable`"
}


variable "tgw_routetable_name" {
  type        = string
  default     = ""
  description = "Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. Default value: `disable`"
}


variable "create_ram_resource_share" {
  type        = bool
  default     = null
  description = "Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. Default value: `disable`"
}



variable "ram_name" {
  type        = string
  default     = ""
  description = "Whether resource attachment requests are automatically accepted. Valid values: `disable`, `enable`. Default value: `disable`"
}

variable "amazon_side_asn" {
  type        = string
  default     = ""
}



