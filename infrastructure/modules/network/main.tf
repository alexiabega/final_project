resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "group2"
  }
}


resource "aws_subnet" "main-public-subnets" {
  for_each = var.SUBNETS

  vpc_id                  = aws_vpc.main-vpc.id
  availability_zone       = "eu-north-1${each.key}"
  cidr_block              = "10.0.${each.value}.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "group2-subnet-${each.value}-prod"
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

  tags = {
    Name = "group2-route-table"
  }
}

resource "aws_route_table_association" "a" {
  for_each = aws_subnet.main-public-subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt.id
}