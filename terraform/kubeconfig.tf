resource "local_file" "kube_config" {
  content = base64decode(vultr_kubernetes.test_kube.kube_config)
  filename = pathexpand("~/.kube/vke-config")
  depends_on = [ vultr_kubernetes.test_kube ]
}