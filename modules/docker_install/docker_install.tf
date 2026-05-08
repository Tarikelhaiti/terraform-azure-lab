resource "null_resource" "install_docker" {
  connection {
    type        = "ssh"
    user        = var.user_name
    host        = var.host
    private_key = file(var.ssh_private_key)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y -qq",
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sudo chmod +x get-docker.sh",
      "sudo ./get-docker.sh"
    ]
  }

  provisioner "file" {
    source      = "${path.module}/startup-options.conf"
    destination = "/tmp/startup-options.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /etc/systemd/system/docker.service.d",
      "sudo cp /tmp/startup-options.conf /etc/systemd/system/docker.service.d/startup-options.conf",
      "sudo systemctl daemon-reload",
      "sudo systemctl restart docker",
      "sleep 10",
      "sudo systemctl status docker --no-pager",
      "sudo docker ps",
      "sudo usermod -aG docker ${var.user_name}"
    ]
  }
}
