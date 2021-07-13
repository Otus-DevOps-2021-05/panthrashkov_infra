variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key.json"
}
variable ssh_private_key_path {
  description = "ssh_private_key_path"
}
variable yandex_compute_instanse_zone {
  description = "yandex_compute_instanse_zone"
  default     = "ru-central1-a"
}
