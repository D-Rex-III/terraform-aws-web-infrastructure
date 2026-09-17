# Terraform AWS Web Infrastructure

A production-style AWS infrastructure portfolio project built with Terraform.

This project demonstrates AWS networking, load balancing, ECS/Fargate, IAM, CloudWatch logging, automated Terraform testing, and CI validation without requiring live AWS resources.

## Architecture

```mermaid
flowchart TB
    Internet((Internet)) --> ALB[Application Load Balancer]

    subgraph VPC["AWS VPC"]
        subgraph AZA["Availability Zone A"]
            PublicA[Public Subnet]
            PrivateA[Private Subnet]
            TaskA[ECS Fargate Task]
        end

        subgraph AZB["Availability Zone B"]
            PublicB[Public Subnet]
            PrivateB[Private Subnet]
            TaskB[ECS Fargate Task]
        end

        ALB --> TaskA
        ALB --> TaskB
        TaskA --> Logs[CloudWatch Logs]
        TaskB --> Logs
    end
Infrastructure
AWS VPC
Two Availability Zones
Public and private subnets
Internet Gateway and routing
Application Load Balancer
Security groups
ECS cluster
ECS Fargate service
IAM task execution role
CloudWatch logging
Terraform outputs
Automated Terraform tests
Validation
terraform init
terraform fmt -check -recursive
terraform validate
terraform test

Terraform's mocked AWS provider is used for testing, so AWS credentials and deployed resources are not required.

Continuous Integration

GitHub Actions automatically runs:

Terraform initialization
Formatting checks
Configuration validation
Automated Terraform tests

on pushes and pull requests to main.

Cost-Conscious Design

This repository is intended as a portfolio and infrastructure-design demonstration. It avoids unnecessary paid infrastructure such as NAT Gateways and does not require live deployment to AWS.

Repository Structure
.
├── .github/workflows/terraform.yml
├── tests/infrastructure.tftest.hcl
├── ecs.tf
├── iam.tf
├── load-balancer.tf
├── locals.tf
├── logging.tf
├── network.tf
├── outputs.tf
├── providers.tf
├── security.tf
├── variables.tf
└── versions.tf
Confidentiality

This repository was created independently as a public portfolio demonstration. It contains no proprietary employer or customer source code, credentials, infrastructure configuration, or confidential information.
