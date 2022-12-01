output "dx_gtwyconnection_id" {
  value = var.create_dx_gateway ? aws_dx_gateway.dx[0].id : ""
  description = "The ID of the gtwy connection"
}
