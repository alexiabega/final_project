resource "aws_vpc" "main-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "group2"
  }
}


resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  availability_zone = "eu-north-1a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "group2-public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  availability_zone = "eu-north-1a"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "group2-private-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "group2-gateway"
  }
}


resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags = {
    Name = "group2-route-table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt.id
}