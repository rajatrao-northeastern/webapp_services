#!/bin/bash

sleep 30

sudo apt-get update -y
sudo apt-get install nginx -y

curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install unzip -y
cd ~/ && unzip WebAppDEV.zip
cd ~/WebAppDEV && npm i

sudo mv /tmp/webapp.service  /etc/systemd/system/webapp.service
sudo systemctl enable webapp.service
sudo systemctl start webapp.service

sudo apt-get update -y
sudo apt-get install -y  mysql-server

