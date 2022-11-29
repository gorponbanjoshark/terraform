output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}

output "get_url" {
  description = "generating curl command to run yo"
  value = "curl http://${aws_instance.example.public_ip}:${var.server_port}/"
}