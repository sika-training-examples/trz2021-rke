resource "helm_release" "rancher-dev" {
  provider         = helm.dev
  name             = "rancher"
  repository       = "https://releases.rancher.com/server-charts/latest"
  chart            = "rancher"
  namespace        = "cattle-system"
  create_namespace = true

  set {
    name  = "hostname"
    value = "rancher.trz-dev.sikademo.com"
  }

  set {
    name  = "tls"
    value = "external"
  }
}
