```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm show values prometheus-community/kube-prometheus-stack > values.yaml
helm install kube-prometheus-stack -n monitoring --create-namespace -f values.yaml prometheus-community/kube-prometheus-stack
```

https://blog.betaman.kr/134
