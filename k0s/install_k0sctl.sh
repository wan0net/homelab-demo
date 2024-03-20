export K0SCTL_VERSION=v0.17.4
curl -LO "https://github.com/k0sproject/k0sctl/releases/download/$K0SCTL_VERSION/k0sctl-linux-x64"
sudo install -o root -g root -m 0755 k0sctl-linux-x64 /usr/local/bin/k0sctl
k0sctl --help