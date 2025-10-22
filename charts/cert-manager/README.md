# Manual steps
1. Create token:
```
kubectl -n cert-manager create secret generic cloudflare-api-token-secret --from-literal=api-token=$CF_TOKEN
```
