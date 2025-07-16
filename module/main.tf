resource "aws_s3_bucket" "main" {
  bucket = "${var.environment}-${var.project_name}-bucket"
}

resource "aws_lambda_function" "main" {
  function_name = "${var.environment}-${var.project_name}-lambda"
  role         = aws_iam_role.lambda_role.arn
  handler      = "index.handler"
  runtime      = "python3.9"
  filename     = "lambda.zip"
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.environment}-lambda-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}