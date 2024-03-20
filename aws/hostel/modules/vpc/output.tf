output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "vpc_id" {
  value = aws_vpc.base_vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gateway.id
}
