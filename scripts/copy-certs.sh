#!/bin/zsh
source ~/.zshrc
CR=$(k get certificaterequest wildcard-k8s-johnchen-dev-2 -n cert-manager -o jsonpath='{.status.certificate}' | base64 -d)
PEM=$(k get secret -n cert-manager wildcard-tls-secret -o yaml | yq '.data["tls.crt"]' | base64 -d | openssl x509 -outform PEM)
echo $CR\\n$PEM | ssh root@nginx "cat > /root/wildcard-cert.pem"

k get secret -n cert-manager wildcard-tls-secret -o yaml | yq '.data["tls.key"]' | base64 -d | ssh root@nginx "cat > /root/wildcard-cert.key"
