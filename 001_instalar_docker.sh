#!/bin/env bash

sudo dnf update -y
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker opc

sudo curl -o /usr/local/bin/docker-compose -L https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-linux-aarch64 
sudo chmod +x /usr/local/bin/docker-compose
sudo /usr/local/bin/docker-compose --version
