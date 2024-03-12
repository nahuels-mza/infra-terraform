# data "aws_ami" "free_tier" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["052c9ea013e6e3567"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["arm64"]
#   }

# }

resource "aws_instance" "ec2" {
  ami           = "ami-052c9ea013e6e3567"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }

  security_groups = [var.security_group]

}
