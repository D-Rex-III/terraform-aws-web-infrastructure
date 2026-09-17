mock_provider "aws" {}

run "network_configuration" {
  command = plan

  assert {
    condition     = aws_vpc.main.enable_dns_support == true
    error_message = "VPC DNS support must be enabled."
  }

  assert {
    condition     = aws_vpc.main.enable_dns_hostnames == true
    error_message = "VPC DNS hostnames must be enabled."
  }

  assert {
    condition     = length(aws_subnet.public) == 2
    error_message = "The environment must contain two public subnets."
  }

  assert {
    condition     = length(aws_subnet.private) == 2
    error_message = "The environment must contain two private subnets."
  }

  assert {
    condition     = aws_route.internet.destination_cidr_block == "0.0.0.0/0"
    error_message = "The public route table must provide an Internet route."
  }
}
