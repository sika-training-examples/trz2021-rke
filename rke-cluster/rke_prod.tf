resource "rke_cluster" "prod" {
  cluster_name   = "trz-prod"
  ssh_agent_auth = true
  nodes {
    address           = "trz-prod-ma-0.sikademo.com"
    hostname_override = "prod-ma-0"
    user              = "root"
    role              = ["controlplane", "etcd"]
  }
  nodes {
    address           = "trz-prod-ma-1.sikademo.com"
    hostname_override = "prod-ma-1"
    user              = "root"
    role              = ["controlplane", "etcd"]
  }
  nodes {
    address           = "trz-prod-ma-2.sikademo.com"
    hostname_override = "prod-ma-2"
    user              = "root"
    role              = ["controlplane", "etcd"]
  }
  nodes {
    address           = "trz-prod-wo-0.sikademo.com"
    hostname_override = "prod-wo-0"
    user              = "root"
    role              = ["worker"]
  }
  nodes {
    address           = "trz-prod-wo-1.sikademo.com"
    hostname_override = "prod-wo-1"
    user              = "root"
    role              = ["worker"]
  }
  nodes {
    address           = "trz-prod-wo-2.sikademo.com"
    hostname_override = "prod-wo-2"
    user              = "root"
    role              = ["worker"]
  }
  nodes {
    address           = "trz-prod-wo-3.sikademo.com"
    hostname_override = "prod-wo-3"
    user              = "root"
    role              = ["worker"]
  }
  ingress {
    provider = "none"
  }
}


output "prod-kubeconfig" {
  value     = rke_cluster.prod.kube_config_yaml
  sensitive = true
}
