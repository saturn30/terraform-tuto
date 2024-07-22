# nginx-ingress-controller

```sh
helm show values oci://registry-1.docker.io/bitnamicharts/nginx-ingress-controller > values.yaml
```

먼저 values.yaml 을 생성한다. 수정할 옵션이 있다면 수정.

```sh
helm install nginx-ingress-controller -n nginx-ingress-controller --create-namespace -f values.yaml oci://registry-1.docker.io/bitnamicharts/nginx-ingress-controller
```

values.yaml을 참조하여 설치
