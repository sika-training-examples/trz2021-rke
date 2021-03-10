provider "helm" {
  alias = "dev"
  kubernetes {
    config_path = "../rke-cluster/kubeconfig.dev.yml"
  }
}

// provider "kubernetes" {
//   alias = "dev"
//   config_path = "../rke-cluster/kubeconfig.dev.yml"
// }
