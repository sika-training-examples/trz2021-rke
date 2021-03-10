terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.0.2"
    }
  }
  required_version = ">= 0.13"
}
