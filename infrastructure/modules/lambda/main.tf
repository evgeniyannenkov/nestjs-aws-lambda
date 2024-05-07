data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    sid    = ""
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json

  tags = {
    Environment = "stg"
    Project     = "API"
  }
}

resource "aws_lambda_function" "lambda" {
  function_name    = var.function_name
  description      = var.description
  role             = aws_iam_role.lambda_execution_role.arn
  filename         = var.package_type == "Zip" ? var.filename : null
  source_code_hash = var.package_type == "Zip" ? var.source_code_hash : null
  image_uri        = var.package_type == "Image" ? var.image_uri : null
  handler          = var.package_type == "Zip" ? var.handler : null
  runtime          = var.package_type == "Zip" ? var.runtime : null
  architectures    = var.architectures
  package_type     = var.package_type
  memory_size = 1024
  environment {
    variables = var.environment_variables
  }
}
