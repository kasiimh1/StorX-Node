#!/bin/bash
echo "Fetching Distro Updates & Upgrades"
apt update 
apt upgrade -y 
apt dist-upgrade -y 
echo "Removing unused files that were automatically installed!"
apt autoremove -y
echo "Upgrading StorX Network Configuration Scripts"
git pull
echo "Upgrading Docker Images"
sudo docker pull storxnetwork/storxnode:latest
sudo docker-compose -f docker-services.yml down
sudo docker-compose -f docker-services.yml up -d
echo "Congrats! Your Node has been successfully updated with latest changes!"
echo "Restarting VPS ....."
sudo reboot