#!/bin/bash

#https://github.com/nuBacuk/docker-openvpn-arm64
sudo modprobe iptable_filter  
sudo modprobe iptable_nat  

/usr/local/bin/kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml

/usr/local/bin/kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.0/cert-manager.yaml

/usr/local/bin/kubectl apply -f 003_letsencrypt-clusterissuer.yaml
