terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.12.0"
    }
  }
}

provider "rancher2" {
  alias = "bootstrap"

  api_url   = "https://rancher.trz-dev.sikademo.com"
  bootstrap = true
}

terraform {
  backend "http" {}
}

resource "random_password" "admin" {
  length           = 16
  special          = true
  override_special = "_"
}

resource "rancher2_bootstrap" "admin" {
  provider = rancher2.bootstrap

  password = random_password.admin.result
}

output "rancher_api_url" {
  value = rancher2_bootstrap.admin.url
}

output "rancher_admin_password" {
  value     = rancher2_bootstrap.admin.password
  sensitive = true
}

output "rancher_token_key" {
  value     = rancher2_bootstrap.admin.token
  sensitive = true
}
