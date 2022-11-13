sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d --version

k3d cluster create k3s --api-port 6550 --k3s-arg "--disable=traefik@server:0" --wait --port "80:80@loadbalancer" --port "443:443@loadbalancer" --agents 2

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml