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
  ami           = "ami-05c969369880fa2c2"
  instance_type = "t2.micro"

  vpc_security_group_ids      = [var.security_group]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true


  depends_on = [var.internet_gateway]

  # Sample Hello World
  user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo bash -c 'echo Hello Terraform World!!! > /var/www/html/index.html'
        EOF
  tags = {
    Name = var.instance_name
  }


}
