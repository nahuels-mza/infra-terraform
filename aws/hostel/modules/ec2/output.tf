output "ec2Id" {
  description = "EC2 instance id"
  value       = aws_instance.ec2.id
}


output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
