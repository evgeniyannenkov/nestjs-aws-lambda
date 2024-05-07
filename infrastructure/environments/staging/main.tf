terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source = "../../modules/ecr"
  lambda_execution_role_name = module.lambda.lambda_execution_role_name
  repository_name            = "nestjs-application-api"
}

module "docker_management" {
  source         = "../../modules/docker_management"
  aws_region     = var.aws_region
  repository_url = module.ecr.repository_url
  image_tag      = var.image_tag
  dockerfile_path = var.api_docker_file_path
}

module "lambda" {
  source                    = "../../modules/lambda"
  function_name             = "${var.application_api_lambda_function_name}_${var.env_suffix}"
  image_uri                 = module.docker_management.docker_image_uri
  package_type              = "Image"
  architectures = ["arm64"]
  environment_variables = {
    // Add environment variables here
    last_deployed = timestamp()
  }
}

module "api_gateway" {
  source            = "../../modules/api_gateway"
  rest_api_name     = module.lambda.name
  lambda_invoke_arn = module.lambda.invoke_arn
  lambda_invoke_function_name = module.lambda.name
  stage_name        = var.env_suffix
}
