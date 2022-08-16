resource "aws_vpc" "elk_vpc" {
  cidr_block = var.vpc_cidr


tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.elk_vpc.id

  tags = {
    Name = "gateway"
  }
}

resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}