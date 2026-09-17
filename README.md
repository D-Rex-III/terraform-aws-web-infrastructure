# Terraform AWS Web Infrastructure

A portfolio project demonstrating production-style AWS infrastructure using Terraform.

The project includes:

- Multi-AZ VPC networking
- Public and private subnets
- Internet Gateway and routing
- Reusable variables and tags
- Terraform automated tests
- Mocked AWS provider testing without deploying real resources

## Validation

```bash
terraform init
terraform fmt -check -recursive
terraform validate
terraform test

This project is designed to demonstrate Terraform and AWS infrastructure skills without requiring live AWS resources or incurring cloud costs.
