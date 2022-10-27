#!/bin/bash
sleep 30
sudo apt-get update -y
sudo apt-get install zip unzip
sudo apt update && sudo apt install --assume-yes curl
sudo apt-get install nginx -y
# curl -sL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt -y install nodejs
sudo apt-get -y install npm
echo "Installing mysql server"
sudo apt-get install mysql-server -y
sudo mysql <<EOF
CREATE DATABASE usersDB;
CREATE USER 'rajat'@'localhost' IDENTIFIED BY 'Rajatrao@0594';
GRANT ALL PRIVILEGES ON usersDB.* TO 'rajat'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
echo "Starting mysql server"
sudo service mysql start
sudo apt-get install -y gcc g++ make
sudo npm i pm2 -g
sleep 10
unzip WebAppDEV.zip
cd WebAppDEV/ && npm i
sudo pm2 start index.js
sudo pm2 save
sudo pm2 startup systemd
