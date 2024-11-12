provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "DEV-VPC"
  }
}

resource "aws_subnet" "bastonhost_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[0]
  availability_zone = "us-east-1a"

  tags = {
    Name = "Bastonhost-subnet-1-RAMA-${var.env}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[1]
  availability_zone = "us-east-1b"

  tags = {
    Name = "public-subnet-2-RAMA-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[0]
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-1-RAMA-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[1]
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-subnet-2-RAMA-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[2]
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-3-RAMA-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[3]
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-subnet-4-RAMA-${var.env}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "DEV-IGW"
  }
}

resource "aws_eip" "nat" {
  tags = {
    Name = "DEV-NAT-Gateway-EIP"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.bastonhost_subnet_1.id

  tags = {
    Name = "DEV-NAT-Gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "DEV-Public-RT"
  }
}

resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "DEV-Private-RT-01"
  }
}

resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "DEV-Private-RT-02"
  }
}

resource "aws_route" "private_nat_route_1" {
  route_table_id         = aws_route_table.private_rt_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route" "private_nat_route_2" {
  route_table_id         = aws_route_table.private_rt_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "public_association_subnet_1" {
  subnet_id      = aws_subnet.bastonhost_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_association_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_association_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt_1.id
}

resource "aws_route_table_association" "private_association_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_rt_2.id
}

resource "aws_route_table_association" "private_association_subnet_3" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt_1.id
}

resource "aws_route_table_association" "private_association_subnet_4" {
  subnet_id      = aws_subnet.private_subnet_4.id
  route_table_id = aws_route_table.private_rt_2.id
}
