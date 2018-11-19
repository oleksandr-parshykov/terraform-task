#!/bin/bash
yum update -y
yum install docker -y
systemctl enable docker
systemctl start docker
eval $(aws ecr get-login --no-include-email --region eu-central-1)              
docker run -dit --name my-website --restart always -p 80:80 ***.dkr.ecr.eu-central-1.amazonaws.com/my-nginx:latest
mkdir ~/task/
echo $(hostname) > ~/task/index.html
docker cp ~/task/index.html my-website:/usr/share/nginx/html/