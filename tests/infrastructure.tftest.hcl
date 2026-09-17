mock_provider "aws" {}

run "infrastructure_configuration" {
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

  assert {
    condition     = aws_lb.main.load_balancer_type == "application"
    error_message = "The load balancer must be an Application Load Balancer."
  }

  assert {
    condition     = aws_lb_target_group.app.target_type == "ip"
    error_message = "The ALB target group must use IP targets for Fargate."
  }

  assert {
    condition     = aws_ecs_task_definition.app.network_mode == "awsvpc"
    error_message = "Fargate tasks must use awsvpc network mode."
  }

  assert {
    condition     = aws_ecs_service.app.desired_count == 2
    error_message = "The ECS service should run two tasks."
  }

  assert {
    condition     = aws_cloudwatch_log_group.ecs.retention_in_days == 7
    error_message = "CloudWatch logs should retain seven days of history."
  }
}
