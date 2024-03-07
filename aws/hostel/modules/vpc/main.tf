data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_vpc" "hostel_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

}

resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.hostel_vpc.id
  cidr_block              = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }

}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.hostel_vpc.id

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.hostel_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

}

resource "aws_route_table_association" "assocation" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
  route_table_id = aws_route_table.route_table.id

}
