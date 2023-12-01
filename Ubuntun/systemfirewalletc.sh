#!/bin/bash

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

# Lock Root Account

sudo passwd -l root

# Autoupdates Setup

sudo apt-get install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades


# Changes all user passwords

awk -F: '$3 >= 1000 && $3 < 65534 { print $1 }' /etc/passwd > ./passchg.txt
sed -i 's/$/:CyberSecure123!/' ./passchg.txt
sudo chpasswd < ./passchg.txt

# Config edits

#sysctl.conf

sudo sed -i '$ a\net.ipv4.conf.all.accept_redirects = 1' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.ip_forward = 0' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.conf.all.rp_filter = 1' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.conf.all.accept_source_route = 0' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.tcp_max_syn_backlog = 2048' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.tcp_synack_retries = 2' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.tcp_syn_retries = 5' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv4.tcp_syncookies = 1' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv6.conf.default.disable_ipv6' /etc/sysctl.conf
sudo sed -i '$ a\net.ipv6.conf.lo.disable_ipv6' /etc/sysctl.conf
sudo cat /etc/sysctl.conf
