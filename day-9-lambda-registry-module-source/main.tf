module "lambda_function" {
    
  # Terraform registry.
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "lambda-function1.lambda_handler"
  runtime       = "python3.12"

  source_path = "lambda-function1.py"
 
  tags = {
    Name = "my-lambda1"
  }
}