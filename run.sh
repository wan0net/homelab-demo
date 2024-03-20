cd terraform
terraform plan -out=plan
terraform apply plan
cd ..
cd ansible
sleep 120
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts machine_id.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts update.yml
cd ..
cd k0s
env SSH_KNOWN_HOSTS=/dev/null ./install_cluster.sh
kubectl get nodes