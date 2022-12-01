provider "aws" {
  access_key = "AKIAW3RF33LHO6YER375"
  secret_key = "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"
  region     = var.region

}

module "vpc-endpoints" {
  source = "../modules"
  region         = var.region
  naming_pattern = var.naming_pattern 
  #Interface VPC Endpoints
  vpcendpoints_interfaces = [
    {
      count                 = var.s3interface ? 1 : 0
      id                    = "s3"
      vpc_id                = var.vpc_id
      subnet_ids            = var.subnet_ids
      create_security_group = false
      security_group_ids    = var.sec_grp_ids
      private_dns_enabled   = false
      allowed_cidr_blocks   = var.private_backend_subnets_cidrs
      inbound_ports         = var.inbound_ports
      tags = {
        Component = "test"
      }
    },
    {
      count                 = var.kmsinterface ? 1 : 0
      id                    = "kms"
      vpc_id                = var.vpc_id
      subnet_ids            = var.subnet_ids
      create_security_group = false
      security_group_ids    = var.sec_grp_ids
      private_dns_enabled   = true
      allowed_cidr_blocks   = var.private_backend_subnets_cidrs
      inbound_ports         = var.inbound_ports
      tags = {
        Component = "test"
      }
    },
    {
      count                 = var.snsinterface      
      id                    = "sns"
      vpc_id                = var.vpc_id
      subnet_ids            = var.subnet_ids
      create_security_group = false
      security_group_ids    = var.sec_grp_ids
      private_dns_enabled   = true
      allowed_cidr_blocks   = var.private_backend_subnets_cidrs
      inbound_ports         = var.inbound_ports
      tags = {
        Component = "test"
      }
    },
    {
      count                 = var.ssminterface      
      id                    = "ssm"
      vpc_id                = var.vpc_id
      subnet_ids            = var.subnet_ids
      create_security_group = false
      security_group_ids    = var.sec_grp_ids
      private_dns_enabled   = true
      allowed_cidr_blocks   = var.private_backend_subnets_cidrs
      inbound_ports         = var.inbound_ports
      tags = {
        Component = "test"
      }
    },
    {
      count                 = var.ec2interface      
      id                    = "ec2"
      vpc_id                = var.vpc_id
      subnet_ids            = var.subnet_ids
      create_security_group = false
      security_group_ids    = var.sec_grp_ids
      private_dns_enabled   = true
      allowed_cidr_blocks   = var.private_backend_subnets_cidrs
      inbound_ports         = var.inbound_ports
      tags = {
        Component = "test"
      }
    },
    {
      count                 = var.monitinterface      
      id                    = "monitoring"
      vpc_id                = var.vpc_id
      subnet_ids            = var.subnet_ids
      create_security_group = false
      security_group_ids    = var.sec_grp_ids
      private_dns_enabled   = true
      allowed_cidr_blocks   = var.private_backend_subnets_cidrs
      inbound_ports         = var.inbound_ports
      tags = {
        Component = "test"
      }
    },
    {
      count                 = var.logsinterface      
      id                    = "logs"
      vpc_id                = var.vpc_id
      subnet_ids            = var.subnet_ids
      create_security_group = false
      security_group_ids    = var.sec_grp_ids
      private_dns_enabled   = true
      allowed_cidr_blocks   = var.private_backend_subnets_cidrs
      inbound_ports         = var.inbound_ports
      tags = {
        Component = "test"
      }
    },
  ]
 #Gateway VPC Endpoints
  vpcendpoints_gateways = [
    {
      count                 = var.s3gtwy      
      id                  = "s3"
      vpc_id              = var.vpc_id
      private_dns_enabled = true
      route_table_ids     = var.private_backend_subnets_rt_ids
      tags = {
        Component = "test"
      }
    },
    {
      count                 = var.dynamogtwy      
      id                  = "dynamodb"
      vpc_id              = var.vpc_id
      private_dns_enabled = true
      route_table_ids     = var.private_backend_subnets_rt_ids
      tags = {
        Component = "test"
      }
    },
  ]
}
