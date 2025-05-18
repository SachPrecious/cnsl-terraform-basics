# Output variables are used to expose information about Terraform-managed resources after they are created.
output "api_gateway_execution_arn" {
  description = "The ARN of the API Gateway execution"
  value       = aws_api_gateway_rest_api.hello_api.execution_arn
}