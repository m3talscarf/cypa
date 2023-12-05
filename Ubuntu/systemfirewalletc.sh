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
cat passchg.txt | while read line
do
chpasswd
done

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

#login.defs

sudo sed -i '$ a\FAILLOG_ENAB YES' /etc/login.defs
sudo sed -i '$ a\LOG_UNKFAIL_ENAB YES' /etc/login.defs
sudo sed -i '$ a\SYSLOG_SU_ENAB YES' /etc/login.defs
sudo sed -i '$ a\SYSLOG_SG_ENAB YES' /etc/login.defs
sudo sed -i '$ a\PASS_MAX_DAYS 90' /etc/login.defs
sudo sed -i '$ a\PASS_MIN_DAYS 10' /etc/login.defs
sudo sed -i '$ a\PASS_WARN_AGE 7' /etc/login.defs
sudo cat /etc/login.defs

#lightdm.conf.d

sudo sed -i '$ a\allow-guest' /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
sudo sed -i '$ a\greeter0hide-user=true' /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
sudo sed -i '$ a\greeter-show-manual-login=true' /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
sudo sed -i '$ a\autologin-user=none' /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
sudo cat /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

#sshd_config

sudo sed -i '$ a\LoginGraceTime 60' /etc/ssh/sshd_config
sudo sed -i '$ a\PermitRootLogin no' /etc/ssh/sshd_config
sudo sed -i '$ a\Protocol 2' /etc/ssh/sshd_config
sudo sed -i '$ a\PermitEmptyPassword no' /etc/ssh/sshd_config
sudo sed -i '$ a\PasswordAuthentication yes' /etc/ssh/sshd_config
sudo sed -i '$ a\X11Fowarding no' /etc/ssh/sshd_config
sudo sed -i '$ a\UsePAM yes' /etc/ssh/sshd_config
sudo sed -i '$ a\UsePrivilegeSeparation yes' /etc/ssh/sshd_config
sudo cat /etc/ssh/sshd_config

#pam.d

sudo sed -i '$ a\password required pam_unix.so remember=5' /etc/pam.d/common-password
sudo sed -i '$ a\password requisite pam_pwquality.so' /etc/pam.d/common-password
sudo cat /etc/pam.d/common-password

#sudoers

sudo sed -i '/Defaults !authenticate/Defaults authenticate' /etc/sudoers
sudo cat /etc/sudoers
