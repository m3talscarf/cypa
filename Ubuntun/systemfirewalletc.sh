#!/bin/bash

# Gives file perms

chmod a+rwx ./systemfirewalletc.sh

# Setup ufw firewall

sudo apt-get install ufw
sudo ufw enable
sudo ufw status

# Updates the system

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

# Secures shadow file

sudo chmod 640 /etc/shadow
