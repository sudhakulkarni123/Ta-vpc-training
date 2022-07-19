resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr
  
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_public

  tags = {
    Name = "public"
  }
}
  resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private

  tags = {
    Name = "private"
    }
  }

  resource "aws_subnet" "data" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_data

  tags = {
    Name = "data"
    }
  }

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}
