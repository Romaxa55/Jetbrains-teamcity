variable "sshkey" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "SSH key for instances"
}

variable "cloud_id" {
  type        = string
  default     = "b1g4nlnq9br985vecmfc"
  description = "Cloud ID for YC"
}

variable "folder_id" {
  type        = string
  default     = "b1gab4fsp67hafns9j2h"
  description = "Folder ID for YC"
}

variable "zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone YC"
}

variable "family-image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image for instance"
}

variable "user" {
  type        = string
  default     = "terraform"
  description = "User instance"
}

variable "boot-disk-size" {
  type        = string
  default     = "20"
  description = "Disk size"
}

variable "instance-name" {
  type        = string
  default     = "work-vm"
  description = "Name instance"
}

variable "worknet" {
  type        = string
  default     = "forapps"
  description = "Name for network"
}

variable "worksubnet" {
  type        = string
  default     = "forapps-subnet"
  description = "Name for subnet"
}

variable "workip" {
  type        = string
  default     = "192.168.5.0/28"
  description = "IP for subnet"
}

/*
variable "int-static" {
  type        = string
  default     = ""
  description = "Internal static IP"
}
*/
/*
variable "route-table" {
  type        = string
  default     = ""
  description = "Name route table"
}
*/
/*
variable "next_hop_address" {
  type        = string
  default     = ""
  description = "Name route table"
}
*/
/*
variable "ext-static" {
  type        = string
  default     = ""
  description = "External static IP"
}
*/
/*
variable "static" {
  type        = string
  default     = ""
  description = "Static IP addres in your network YC"
}
*/
/*
variable "dns-zone" {
  type        = string
  default     = ""
  description = "Domain zone"
}
*/
/*
variable "dns-name" {
  type        = string
  default     = ""
  description = "Name for resource yandex_dns_zone"
}
*/
