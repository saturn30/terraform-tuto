```sh
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm show values grafana/loki-stack > values.yaml
helm upgrade --install loki-stack -n monitoring --create-namespace -f values.yaml grafana/loki-stack
```
