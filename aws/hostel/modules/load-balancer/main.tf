resource "aws_elb" "load_balancer" {
  name            = "base load balancer"
  subnets         = [aws_subnet.subnet1.id]
  security_groups = [aws_security_group.sec1.id]
  instances       = [aws_instance.web1.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"


  }

}
