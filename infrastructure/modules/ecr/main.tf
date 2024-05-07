resource "aws_ecr_repository" "nestjs_app" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"
}

data "aws_iam_policy_document" "lambda_ecr_access" {
  statement {
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetAuthorizationToken"
    ]
    effect = "Allow"
    resources = [
      aws_ecr_repository.nestjs_app.arn
    ]
  }
}

resource "aws_iam_policy" "lambda_ecr_access_policy" {
  name   = "lambda_ecr_access_policy"
  policy = data.aws_iam_policy_document.lambda_ecr_access.json
}

# Attach the policy to the lambda execution role so that it can access the ECR repository
resource "aws_iam_role_policy_attachment" "lambda_ecr_access_attachment" {
  role       = var.lambda_execution_role_name
  policy_arn = aws_iam_policy.lambda_ecr_access_policy.arn
}

