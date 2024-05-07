variable "aws_region" {
  description = "AWS region for the ECR repository"
  type        = string
}

variable "image_tag" {
  description = "Tag for the Docker image"
  type        = string
}

variable "repository_url" {
  description = "URL of the ECR repository"
  type        = string
}

variable "dockerfile_path" {
  description = "Path to the Dockerfile"
  type        = string
}