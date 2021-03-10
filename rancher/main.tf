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

variable "rancher_token_key" {}
provider "rancher2" {
  api_url   = "https://rancher.trz-dev.sikademo.com"
  token_key = var.rancher_token_key
}

resource "rancher2_user" "root" {
  name     = "Root User"
  username = "root"
  password = "root"
  enabled  = true
}

resource "rancher2_global_role_binding" "root" {
  name           = "root"
  global_role_id = "admin"
  user_id        = rancher2_user.root.id
}

resource "rancher2_user" "gitlab-ci" {
  name     = "Gitlab CI"
  username = "gitlab-ci"
  password = "gitlab-ci"
  enabled  = true
}

resource "rancher2_global_role_binding" "gitlab-ci" {
  name           = "gitlab-ci"
  global_role_id = "admin"
  user_id        = rancher2_user.root.id
}

resource "rancher2_cluster" "prod" {
  name = "prod"
}

resource "rancher2_token" "gitlab-ci" {
  // cluster_id = rancher2_cluster.prod.id
  description = "Gitlab CI Prod"
  // ttl = 1200
}

output "gitlab-ci-token" {
  value = rancher2_token.gitlab-ci.token
}
