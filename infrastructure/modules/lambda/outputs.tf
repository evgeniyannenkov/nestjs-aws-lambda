output "lambda_arn" {
  value = aws_lambda_function.lambda.arn
}

output "invoke_arn" {
  value = aws_lambda_function.lambda.invoke_arn
}

output "name" {
  value = aws_lambda_function.lambda.function_name
}

output "lambda_execution_role_name" {
  value = aws_iam_role.lambda_execution_role.name
}