//terraform {
//  required_providers {
//    yandex ="0.35"
//    yandex = {
//      source = "yandex-cloud/yandex"
//    }
//  }
//
//  backend "s3" {
//    endpoint   = "storage.yandexcloud.net"
//    bucket     = "terraform-object-storage-tutorial" //var.yandex_backed_name
//    region     = "ru-central1-a"
////    region = "us-east-1"
//    key        = "tfstates/stage.tfstate"
//    access_key = "<идентификатор статического ключа>"
//    secret_key = "<секретный ключ>"
//    skip_region_validation      = true
//    skip_credentials_validation = true
//  }
//}

provider "yandex" {
  version                  = "0.35"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_storage_bucket" "terraform-object-storage-tutorial" {
  bucket = var.yandex_backed_name
}


module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
}

