
resource "yandex_compute_instance" "wp-app" {

  for_each = var.instances

  name = "wp-app-${each.key}"
  zone = "ru-central1-${each.value}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80viupr3qjr5g6g9du" #Ubuntu
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.wp-subnet[each.key].id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.path_to_ssh_pub_key)}"
  }

  provisioner "remote-exec" {
    inline = [
      // спим пока яндекс не закончит свою предустановку и ставим нужное нам
      "sh -c \"sleep 200 && sudo apt update  -y && sudo apt install nginx -y && sudo systemctl start nginx && sudo systemctl enable nginx\"",
      "sudo sh -c \"echo '<h4>Hello from iac course</h4><br><h5>My ip: $(curl https://ifconfig.me/)</h5>' > /var/www/html/index.nginx-debian.html\"",
    ]
    connection {
      host        = self.network_interface.0.nat_ip_address
      type        = "ssh"
      user        = var.username
      private_key = file(var.path_to_ssh_priv_key)
    }
  }
}