
output "transit-gateway-id" {
  description = "Transit gateway ID"
  #value       = aws_ec2_transit_gateway.tgw[0].id
  value       = var.create_transit_gateway ? aws_ec2_transit_gateway.tgw[0].id : ""
}

output "transit-gateway-arn" {
  description = "Transit gateway ARN"
  value       = var.create_transit_gateway ? aws_ec2_transit_gateway.tgw[0].arn : ""
}

output "transit-gateway-rt-id" {
  description = "Transit gateway route table id"
  value       = (var.create_transit_gateway_route_table && var.create_transit_gateway) ? aws_ec2_transit_gateway_route_table.default[0].id : ""
}
