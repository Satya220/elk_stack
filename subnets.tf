resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.cidr_public
  availability_zone = var.availability_zone_1

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.cidr_private_1
  availability_zone = var.availability_zone_2

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.cidr_private_2
  availability_zone = var.availability_zone_3

  tags = {
    Name = "private_subnet_2"
  }
}