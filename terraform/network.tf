resource "yandex_vpc_network" "wp-network" {
  name = "wp-network"
}

resource "yandex_vpc_subnet" "wp-subnet" {
  for_each = var.instances

  name           = "wp-subnet-${each.key}"
  v4_cidr_blocks = ["10.${each.key}.0.0/24"]
  zone           = "ru-central1-${each.value}"
  network_id     = yandex_vpc_network.wp-network.id
}
