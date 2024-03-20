data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_vpc" "base_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Terraform VPC"
  }

}

resource "aws_subnet" "public_subnet" {

  vpc_id                  = aws_vpc.base_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }

}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.base_vpc.id

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.base_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

}

resource "aws_route_table_association" "assocation" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id

}

resource "aws_route" "internet_route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.route_table.id
  gateway_id             = aws_internet_gateway.gateway.id
}
