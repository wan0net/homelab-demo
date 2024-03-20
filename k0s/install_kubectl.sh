export K3S_VERSION=v1.27.8
curl -LO "https://dl.k8s.io/release/$K3S_VERSION/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$K3S_VERSION/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client --output=yaml
rm kubectl
rm kubectl.sha256