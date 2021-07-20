terraform {
  required_providers {
    yandex ="0.35"
//    yandex = {
//      source = "yandex-cloud/yandex"
//    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-object-storage-tutorial" //var.yandex_backed_name
    region     = "ru-central1-a"
//    region = "us-east-1"
    key        = "tfstates/reddit-app/stage.tfstate"
//    access_key = "<идентификатор статического ключа>"
//    secret_key = "<секретный ключ>"
//    skip_region_validation      = true
//    skip_credentials_validation = true
  }
}
