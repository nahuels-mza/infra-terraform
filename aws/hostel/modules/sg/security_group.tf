resource "aws_security_group" "base_sg" {
  name = "base_security_group"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egress_port
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  # Make sure to check the vpc_id and it should match with the subnet vpc_id
  vpc_id = var.vpc_id

}
