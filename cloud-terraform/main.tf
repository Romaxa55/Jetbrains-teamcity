terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "gateway-a" {
  name        = "gateway-centos-7-a"
  description = "Gateway instance"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  labels = {
    enviroment = "qa"
    type       = "gateway"
  }

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      image_id = "fd83869rbingor0in0ui"
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.qa-subnet-a.id
  }
}
