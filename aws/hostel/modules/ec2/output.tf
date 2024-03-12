output "ec2Id" {
  description = "EC2 instance id"
  value       = aws_instance.ec2.id
  precondition {
    condition     = aws_instance.ec2.instance_type == "t2.micro"
    error_message = "The instance type is different than t2.micro"
  }
}


output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
