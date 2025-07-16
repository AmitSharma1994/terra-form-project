data "aws_iam_role" "existing_lambda_role" {
  name = "lambda-execution-role"
}

resource "aws_lambda_function" "app" {
  function_name = "${var.environment}-app-lambda"
  role         = data.aws_iam_role.existing_lambda_role.arn
  handler      = "lambda_function.lambda_handler"
  runtime      = "python3.9"
  filename     = "lambda_deployment.zip"
}