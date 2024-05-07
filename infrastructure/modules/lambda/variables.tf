variable "source_code_hash" {
  type        = string
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with filename."
  default     = null
}

variable "filename" {
  type        = string
  description = "The path to the Lambda function's deployment package."
  default     = null
}

variable "image_uri" {
  type        = string
  description = "ECR image URI for container-based Lambda."
  default     = null
}

variable "function_name" {
  type = string
}

variable "handler" {
  type        = string
  description = "The function entrypoint in your code."
  default     = null
}

variable "runtime" {
  type        = string
  description = "The identifier of the function's runtime."
  default     = null
}

variable "package_type" {
    type        = string
    description = "The package type."
    default = "Image"
}

variable "architectures" {
    type        = list(string)
    description = "Instruction set architecture for Lambda function."
    default = ["arm64"]
}

variable "description" {
    type        = string
    description = "Description of what your Lambda does."
    default     = null
}

variable "environment_variables" {
  type = map(string)
  default = {}
}
