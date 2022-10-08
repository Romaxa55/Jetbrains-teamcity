output "external_ip_address_vm-workspace" {
  value = yandex_compute_instance.workinstance.network_interface.0.nat_ip_address
  description = "External IP"
}