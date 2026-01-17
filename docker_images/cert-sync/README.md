docker buildx build --platform linux/amd64 --tag harbor.k8s.johnchen.dev/library/cert-sync:latest .
docker push harbor.k8s.johnchen.dev/library/cert-sync:latest
