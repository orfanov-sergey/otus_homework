

resource "yandex_lb_target_group" "wp_tg" {
  name = "wp-target-group"

  dynamic "target" {
    for_each = yandex_compute_instance.wp-app

    content {
      subnet_id = yandex_vpc_subnet.wp-subnet[target.key].id
      address   = target.value.network_interface.0.ip_address
    }
  }
}


resource "yandex_lb_network_load_balancer" "wp_lb" {

  name = "wp-network-load-balancer"

  listener {
    name = "wp-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.wp_tg.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}