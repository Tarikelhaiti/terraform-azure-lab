resource "docker_image" "nginx" {
  name = "nginx:latest"
}
resource "docker_network" "mynetwork" {
  name   = "networking"
  driver = "bridge"
  ipam_config {
    subnet = "172.20.0.0/16"
  }
}

resource "docker_volume" "nginxdata" {
  name = "nginxdata"
}

resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8080
  }
  networks_advanced {
    name = docker_network.mynetwork.name
  }
  volumes {
    volume_name    = docker_volume.nginxdata.name
    container_path = "/usr/share/nginx/html"
  }

}
