# Created Required VPC / Subnets / IGw / NatGw and Other Security Groups and Policies 
resource "aws_vpc" "telleroo_vpc" {
  cidr_block           = var.vpc_main_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.name}-${var.environment}"
  }

}


resource "aws_subnet" "telleroo_subnet_public_a" {
  vpc_id            = aws_vpc.telleroo_vpc.id
  cidr_block        = var.public_cidr_1
  availability_zone = format("%sa", var.aws_region)
  tags = {
    Name = "${var.name}_public"
  }
}

resource "aws_subnet" "telleroo_subnet_public_b" {
  vpc_id            = aws_vpc.telleroo_vpc.id
  cidr_block        = var.public_cidr_2
  availability_zone = format("%sb", var.aws_region)
  tags = {
    Name = "${var.name}_public"
  }

}

resource "aws_subnet" "telleroo_subnet_private_a" {
  vpc_id            = aws_vpc.telleroo_vpc.id
  cidr_block        = var.private_cidr_1
  availability_zone = format("%sa", var.aws_region)
  tags = {
    Name = "${var.name}_private"
  }

}

resource "aws_subnet" "telleroo_subnet_private_b" {
  vpc_id            = aws_vpc.telleroo_vpc.id
  cidr_block        = var.private_cidr_2
  availability_zone = format("%sb", var.aws_region)
  tags = {
    Name = "${var.name}_private"
  }

}

resource "aws_subnet" "telleroo_subnet_private_rds_a" {
  vpc_id            = aws_vpc.telleroo_vpc.id
  cidr_block        = var.private_rds_cidr_1
  availability_zone = format("%sa", var.aws_region)
  tags = {
    Name = "${var.name}_private_rds"
  }

}

resource "aws_subnet" "telleroo_subnet_private_rds_b" {
  vpc_id            = aws_vpc.telleroo_vpc.id
  cidr_block        = var.private_rds_cidr_2
  availability_zone = format("%sb", var.aws_region)
  tags = {
    Name = "${var.name}_private_rds"
  }

}

resource "aws_internet_gateway" "telleroo_inet_gw" {
  vpc_id = aws_vpc.telleroo_vpc.id
}

resource "aws_eip" "telleroo_nat_gw_eip" {
  vpc = true
}

resource "aws_nat_gateway" "telleroo_nat_gw" {
  depends_on        = [aws_eip.telleroo_nat_gw_eip]
  allocation_id     = aws_eip.telleroo_nat_gw_eip.id
  subnet_id         = aws_subnet.telleroo_subnet_public_a.id
  connectivity_type = "public"
}

resource "aws_route_table" "telleroo_public_rt" {
  depends_on = [aws_internet_gateway.telleroo_inet_gw]
  vpc_id     = aws_vpc.telleroo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.telleroo_inet_gw.id
  }
  tags = {
    Name = "${var.name}_public_rt"
  }
}

resource "aws_route_table" "telleroo_private_rt" {
  depends_on = [aws_nat_gateway.telleroo_nat_gw]
  vpc_id     = aws_vpc.telleroo_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.telleroo_nat_gw.id
  }
  tags = {
    Name = "${var.name}_private_rt"
  }
}


resource "aws_route_table" "telleroo_private_rds_rt" {
  depends_on = [aws_nat_gateway.telleroo_nat_gw]
  vpc_id     = aws_vpc.telleroo_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.telleroo_nat_gw.id
  }
  tags = {
    Name = "${var.name}_private_rds_rt"
  }
}

resource "aws_route_table_association" "telleroo_public_rt_asso_a" {
  subnet_id      = aws_subnet.telleroo_subnet_public_a.id
  route_table_id = aws_route_table.telleroo_public_rt.id
}

resource "aws_route_table_association" "telleroo_public_rt_asso_b" {
  subnet_id      = aws_subnet.telleroo_subnet_public_b.id
  route_table_id = aws_route_table.telleroo_public_rt.id
}

resource "aws_route_table_association" "telleroo_private_rt_asso_a" {
  subnet_id      = aws_subnet.telleroo_subnet_private_a.id
  route_table_id = aws_route_table.telleroo_private_rt.id
}

resource "aws_route_table_association" "telleroo_private_rt_asso_b" {
  subnet_id      = aws_subnet.telleroo_subnet_private_b.id
  route_table_id = aws_route_table.telleroo_private_rt.id
}

resource "aws_route_table_association" "telleroo_private_rds_rt_asso_a" {
  subnet_id      = aws_subnet.telleroo_subnet_private_rds_a.id
  route_table_id = aws_route_table.telleroo_private_rds_rt.id
}

resource "aws_route_table_association" "telleroo_private_rds_rt_asso_b" {
  subnet_id      = aws_subnet.telleroo_subnet_private_rds_b.id
  route_table_id = aws_route_table.telleroo_private_rds_rt.id
}

