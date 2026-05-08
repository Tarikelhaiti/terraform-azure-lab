output "public_ip" {
  value = module.create_vm.public_ip
}
output "nginx_ip" {
  value = module.create_docker_nginx.container_ip
}
