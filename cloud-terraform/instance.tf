data "yandex_compute_image" "image-instance" {
  family = var.family-image
}

resource "yandex_compute_instance" "workinstance" {
  name        = var.instance-name
  zone        = var.zone
  description = "VM for work tasks"
  hostname    = var.instance-name
  allow_stopping_for_update = true
    
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.image-instance.id}"
      size = var.boot-disk-size
    }
  }

  network_interface {
    subnet_id       = "${yandex_vpc_subnet.apps-subnet.id}"
#    ip_address      = var.int-static
#    nat_ip_address  = var.ext-static
    nat             = true
  }

  metadata = {
    ssh-keys = "${var.user}:${file(var.sshkey)}"
#    ssh-keys = var.sshkey
    }
}
