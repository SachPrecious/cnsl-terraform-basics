# cnsl-terraform-basics

This project demonstrates basic usage of Terraform to deploy an AWS Lambda function and expose it via API Gateway.

## What is an API?

An **API (Application Programming Interface)** acts as a messenger that allows different software systems to communicate with each other. 

A common analogy is a restaurant:
- The **customer** (end user) makes a request (order) to the **waiter** (API).
- The **waiter** takes the order to the **chef** (server/back-end system), who prepares the food (data/response).
- The **waiter** then delivers the food (response) back to the customer.

This way, the customer doesn't interact directly with the chef or the kitchen, just as users don't interact directly with the server—they use the API as an intermediary.

![API Restaurant Analogy](./api-restaurant-analogy.png)

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate credentials

## Usage

1. **Zip the Lambda function code**

   Run the following command to package your Lambda function:

   ```sh
   zip lambda_code.zip index.mjs
   ```

2. **Initialize Terraform**

   ```sh
   terraform init
   ```

3. **Plan the deployment**

   ```sh
   terraform plan
   ```

4. **Apply the configuration**

   ```sh
   terraform apply
   ```

## Project Structure

- `index.mjs` - Lambda function source code
- `lambda_code.zip` - Zipped Lambda deployment package
- `lambda.tf` - Lambda and IAM resources
- `api_gateway.tf` - API Gateway module usage
- `modules/api-gateway/` - API Gateway Terraform module

## Notes

- Update `terraform.tfvars` with your desired values if needed.
- The Lambda function runtime is set to `nodejs22.x`.
