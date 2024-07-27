```sh
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update

helm show values metrics-server/metrics-server > values.yaml
helm upgrade --install metrics-server -n monitoring --create-namespace -f values.yaml metrics-server/metrics-server
```
