variable "project_name" {
  description = "Name used to identify resources in this project."
  type        = string
  default     = "portfolio-web"
}

variable "aws_region" {
  description = "AWS region for the infrastructure."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones used by the environment."
  type        = list(string)

  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}
