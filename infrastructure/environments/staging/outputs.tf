output "api_gateway_invoke_url" {
  description = "The URL used to invoke the API Gateway"
  value       = "https://${module.api_gateway.api_id}.execute-api.${var.aws_region}.amazonaws.com/${module.api_gateway.stage_name}/"
}
