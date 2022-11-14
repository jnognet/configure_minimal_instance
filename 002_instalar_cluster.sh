#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
/usr/local/bin/kubectl version --client
rm -f kubectl

sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
/usr/local/bin/k3d --version

sudo /usr/local/bin/k3d cluster create k3s --api-port 6550 --k3s-arg "--disable=traefik@server:0" --wait --port "80:80@loadbalancer" --port "443:443@loadbalancer" --agents 2
sudo mkdir -p /home/opc/.kube/
sudo /usr/local/bin/k3d kubeconfig get -a > /home/opc/.kube/config
sudo chown opc.opc -R /home/opc/.kube
