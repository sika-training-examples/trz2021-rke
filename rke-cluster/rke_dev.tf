resource "rke_cluster" "dev" {
  cluster_name   = "trz-dev"
  ssh_agent_auth = true
  nodes {
    address           = "trz-dev-ma-0.sikademo.com"
    hostname_override = "dev-ma-0"
    user              = "root"
    role              = ["controlplane", "etcd"]
  }
  nodes {
    address           = "trz-dev-ma-1.sikademo.com"
    hostname_override = "dev-ma-1"
    user              = "root"
    role              = ["controlplane", "etcd"]
  }
  nodes {
    address           = "trz-dev-ma-2.sikademo.com"
    hostname_override = "dev-ma-2"
    user              = "root"
    role              = ["controlplane", "etcd"]
  }
  nodes {
    address           = "trz-dev-wo-0.sikademo.com"
    hostname_override = "dev-wo-0"
    user              = "root"
    role              = ["worker"]
  }
  nodes {
    address           = "trz-dev-wo-1.sikademo.com"
    hostname_override = "dev-wo-1"
    user              = "root"
    role              = ["worker"]
  }
  ingress {
    provider = "none"
  }
}


output "dev-kubeconfig" {
  value     = rke_cluster.dev.kube_config_yaml
  sensitive = true
}
