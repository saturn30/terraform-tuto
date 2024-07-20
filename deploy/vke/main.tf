resource "vultr_kubernetes" "test_kube" {
  region = var.VULTR_REGION
  label = var.VULTR_CLUSTER_NAME
  version = var.VULTR_CLUSTER_VERSION
  enable_firewall = true

  node_pools {
    node_quantity = 1
    plan = "vc2-1c-2gb"
    label = "vke-nodepool"
    auto_scaler = true
    min_nodes = 1
    max_nodes = 5
  }
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
  depends_on = [ local_file.kube_config ]
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
  depends_on = [ local_file.kube_config ]
}
