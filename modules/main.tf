// main.tf is used to store the main configurations for the specified module. but this is optional.
# It is used to define the resources that will be created by this module.
resource "aws_api_gateway_rest_api" "hello_api" {
  name = var.api_gateway_name

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
resource "aws_api_gateway_resource" "hello_resource" {
  rest_api_id = aws_api_gateway_rest_api.hello_api.id
  parent_id   = aws_api_gateway_rest_api.hello_api.root_resource_id
  path_part   = "hello"
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.hello_api.id

  triggers = {
    redeployment = timestamp()
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.hello_api.id
  stage_name    = "api"
}
resource "aws_api_gateway_method" "example" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.hello_resource.id
  rest_api_id   = aws_api_gateway_rest_api.hello_api.id
}
resource "aws_api_gateway_integration" "example" {
  http_method             = aws_api_gateway_method.example.http_method
  resource_id             = aws_api_gateway_resource.hello_resource.id
  rest_api_id             = aws_api_gateway_rest_api.hello_api.id
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
  integration_http_method = "POST"
}

