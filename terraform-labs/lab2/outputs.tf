output "urls" {
  description = "Har container ka address"
  value       = [for c in docker_container.web : "http://localhost:${c.ports[0].external}"]
}

output "network_name" {
  value = docker_network.app.name
}
