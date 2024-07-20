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
    min_nodes = 2
    max_nodes = 5
  }
}