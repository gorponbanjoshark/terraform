provider "docker" {}

resource "docker_image" "nginx-image" {
    name = "nginx:latest"
}

resource "docker_container" "nginx" {
    image = docker_image.nginx-image.image_id
    name = "nginx"
    ports {
        internal = 80
        external = var.external_port
        protocol = "tcp"
    }
}

output "url" {
    description = "Browser URL for container site, yo?"
    value       = join(":", ["http://localhost", tostring(var.external_port)])
}