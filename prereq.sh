sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get clean -y
sudo apt-get install ca-certificates gnupg

# Hashicorp
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Docker
#wget -O- https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update && sudo apt install terraform vault envconsul docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

chmod +x ./k0s/install_k0sctl.sh
./k0s/install_k0sctl.sh

chmod +x ./k0s/install_kubectl.sh
./k0s/install_kubectl.sh