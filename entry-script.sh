#!/bin/bash
sudo apt update
sudo apt install docker.io -y
sudo usermod aG docker ec2-user
sudo systemctl start docker
sudo systemctl enable docker
docker run -p 8080:80 nginx 