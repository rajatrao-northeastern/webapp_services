#!/bin/bash
sleep 30
sudo apt-get update -y
sudo apt-get install zip unzip
sudo apt update && sudo apt install --assume-yes curl
sudo apt-get install nginx -y
# curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
echo "Setup 14.x"
sudo apt -y install nodejs
echo "Setup 14.x"
sudo apt-get -y install npm
sudo apt-get install -y gcc g++ make
sudo npm i pm2 -g
sleep 10
unzip webappDEV.zip
cd webappDEV/ && npm i
sudo pm2 start index.js
sudo pm2 ls
sudo pm2 save
sudo pm2 startup systemd