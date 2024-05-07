variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1" # Frankfurt
}

variable "env_suffix" {
  description = "Environment suffix to differentiate resources"
  type        = string
  default     = "staging"
}

variable "application_api_lambda_function_name" {
  description = "Name of the Lambda function contains application API"
  type        = string
  default     = "nestjs_application_api"
}

variable "api_docker_file_path" {
  description = "Path to the Dockerfile of the API Lambda function"
  type        = string
  default     = "../../.."
}
variable "image_tag" {
    description = "Tag of the Docker image of the API Lambda function"
    type        = string
}