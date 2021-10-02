
resource "yandex_compute_instance" "wp-app" {

  for_each = var.instance_count

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
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  provisioner "remote-exec" {
      inline = [
          "sh -c \"sleep 200 && sudo apt update  -y && sudo apt install nginx -y && sudo systemctl start nginx && sudo systemctl enable nginx\"",
      ]
      connection {
          host = "${self.network_interface.0.nat_ip_address}"
          type = "ssh"
          user = var.username
          private_key = "${file(var.path_to_ssh_key)}"
      }
  }
}