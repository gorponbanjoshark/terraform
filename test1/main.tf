variable "server_port" {
    description = "server port to use yo"
    type = number
    default = 8080
}

output "public_server_port" {
    value = var.server_port
    description = "print the value of server_port"
}