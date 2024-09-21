output "instance" {
  value = aws_instance.myapp-server[*].id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.myapp-server[*].public_ip
}
