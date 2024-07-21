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

resource "null_resource" "wait_for_cluster" {
  depends_on = [local_file.kube_config]  // kubeconfig 파일 생성 후 실행

  provisioner "local-exec" {
    command = <<-EOT
      until kubectl --kubeconfig=${local_file.kube_config.filename} get nodes &>/dev/null; do
        echo "클러스터가 아직 준비되지 않았습니다. 10초 후 다시 시도합니다..."
        sleep 10
      done
      echo "Kubernetes 클러스터 연결 성공"
    EOT
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
  depends_on = [ null_resource.wait_for_cluster ]
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
  depends_on = [ null_resource.wait_for_cluster ]
}
