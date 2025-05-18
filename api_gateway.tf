module "api_gateway" {
  source            = "./modules/api-gateway"
  api_gateway_name  = var.api_gateway_name
  lambda_invoke_arn = aws_lambda_function.hello_lambda.invoke_arn // this must be .invoke_arn not .arn : initially i put .arn that was the exact error i got 
}