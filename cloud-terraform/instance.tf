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
    cores  = 4
    memory = 12
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.image-instance.id}"
      size = var.boot-disk-size
    }
  }

  network_interface {
    subnet_id       = "${yandex_vpc_subnet.apps-subnet.id}"
    nat             = true
  }

  metadata = {
    ssh-keys = "${var.user}:${file(var.sshkey)}"
    }

   connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file(var.ssprivatehkey)}"
    host        = self.network_interface.0.nat_ip_address
  }
  provisioner "remote-exec" {
    inline = [
	  "sudo apt-get update",
      "sudo apt-get install docker.io docker-compose git -y",
      "git clone --branch develop https://github.com/Romaxa55/Jetbrains-teamcity.git",
      "sudo usermod -a -G docker ubuntu && sudo systemctl enable docker && sudo service docker restart",
      "newgrp docker",
      "docker network create web",
    ]
  }
}
