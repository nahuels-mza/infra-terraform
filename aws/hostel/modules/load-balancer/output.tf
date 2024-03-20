output "aws_load_balancer_public_dns" {
  value = aws_elb.load_balancer.dns_name

}
