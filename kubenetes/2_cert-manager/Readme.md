# nginx-ingress-controller

```sh
helm show values oci://registry-1.docker.io/bitnamicharts/cert-manager > values.yaml
```

먼저 values.yaml 을 생성한다. 수정할 옵션이 있다면 수정함.
`installCRDs`를 true로 수정한다.(기본값 false) 이 작업을 하지 않으면 이후 issuer 등록에서 에러가 발생함

```sh
helm install cert-manager -n cert-manager --create-namespace -f values.yaml oci://registry-1.docker.io/bitnamicharts/cert-manager
```

values.yaml을 참조하여 설치
