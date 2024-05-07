output "api_id" {
  description = "The ID of the deployed REST API"
  value       = aws_api_gateway_rest_api.api.id
}

output "stage_name" {
  description = "The name of the deployment stage"
  value       = aws_api_gateway_deployment.deployment.stage_name
}

output "invoke_url" {
  description = "The URL used to invoke the API Gateway"
  value       = "https://${aws_api_gateway_rest_api.api.execution_arn}/${aws_api_gateway_deployment.deployment.stage_name}/"
}

output "execution_arn" {
  description = "The execution ARN of the API Gateway"
  value       = aws_api_gateway_rest_api.api.execution_arn
}