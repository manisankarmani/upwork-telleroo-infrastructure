data "aws_caller_identity" "live_account" {}

data "aws_subnets" "telleroo_network_private_app" {
  filter {
    name   = "vpc-id"
    values = [ aws_vpc.telleroo_vpc.id ]
  }

  tags = {
    Name = "${var.name}_private"
  }
}

data "aws_subnets" "telleroo_network_private_rds" {
  filter {
    name   = "vpc-id"
    values = [ aws_vpc.telleroo_vpc.id ]
  }

  tags = {
    Name = "${var.name}_private_rds"
  }
}

data "aws_subnets" "telleroo_network_public_app" {
  filter {
    name   = "vpc-id"
    values = [ aws_vpc.telleroo_vpc.id ]
  }

  tags = {
    Name = "${var.name}_public"
  }
}

# resource "aws_ecs_cluster" "telleroo_application_ecs" {
#   name               = format("%s-%s-ecs-cluster", var.name, var.environment)
#   capacity_providers = ["FARGATE_SPOT", "FARGATE"]
#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
# }

# resource "aws_lb" "telleroo_application_alb" {
#   name               = format("%s-%s-alb", var.name, var.environment)
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.allow_internet_to_alb.id]
#   subnets            = [aws_subnet.telleroo_subnet_public_a.id, aws_subnet.telleroo_subnet_public_b.id]
# }
