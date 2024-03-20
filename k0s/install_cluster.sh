k0sctl apply --config k0sctl-prod.yaml  --disable-telemetry=true
k0sctl kubeconfig --config k0sctl-prod.yaml > kubeconfig  --disable-telemetry=true
mkdir -p ~/.kube
cp kubeconfig ~/.kube/config