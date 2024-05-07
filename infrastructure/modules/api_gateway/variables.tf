variable "rest_api_name" {
  type        = string
  description = "The name of the REST API"
}

variable "lambda_invoke_arn" {
  type        = string
  description = "ARN of the Lambda function to invoke"
}

variable "lambda_invoke_function_name" {
  type        = string
  description = "Name of the Lambda function to invoke"
}

variable "stage_name" {
  type        = string
  description = "Stage name for the deployment"
}
