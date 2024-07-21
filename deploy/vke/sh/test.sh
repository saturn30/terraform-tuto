
KUBECONFIG_PATH="$HOME/.kube/vke-config"

check_cluster_connection() {
    kubectl --kubeconfig=$KUBECONFIG_PATH get nodes &>/dev/null
    return $?
}

echo "Kubernetes 클러스터 연결 대기 중..."
while ! check_cluster_connection; do
    echo "클러스터가 아직 준비되지 않았습니다. 10초 후 다시 시도합니다..."
    sleep 10
done