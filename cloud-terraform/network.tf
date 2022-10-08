resource "yandex_vpc_network" "forapps" {
    name = var.worknet
}

resource "yandex_vpc_subnet" "apps-subnet" {
    name           = var.worksubnet
    v4_cidr_blocks = [var.workip]
    zone           = var.zone
    network_id     = "${yandex_vpc_network.forapps.id}"
}
