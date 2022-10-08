/*
resource "yandex_dns_zone" "project-domain" {
  name        = var.dns-name
  description = "My zone for graduation project"

  labels = {
    label1 = "netology"
  }

  zone             = var.dns-zone
  public           = false
  private_networks = [yandex_vpc_network.forapps.id]
}
*/