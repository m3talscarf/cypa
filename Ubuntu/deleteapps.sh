#!/bin/bash

#Remove Apache

read -p "Delete Apache? y/n" ynapache

if [ "$ynapache" = 'y' ]
	then

	sudo apt remove apache2
	sudo apt purge apache2
	sudo dpkg --purge apache2
	echo 'Apache Removed!'

else

	echo 'Apache Remains'
	
fi

#Removes bad programs

echo 'Purging'

sudo apt-get remove john hydra nginx samba bind9 tftpd x11vnc tightvncserver snmp nfs-kernel-server sendmail postfix xinetd

sudo apt-get purge john hydra nginx samba bind9 tftpd x11vnc tightvncserver snmp nfs-kernel-server sendmail postfix xinetd

sudo dpkg --purge john hydra nginx samba bind9 vsftpd tftpd x11vnc tightvncserver snmp nfs-kernel-server sendmail postfix xinetd

#Removes vsftpd or in future configs it

read -p "Delete = y or Config = n" ynvsftpd

if [ "$ynvsftpd" = 'y' ]
	then

	sudo apt-get remove vsftpd
	sudo apt-get purge vsftpd
	sudo dpkg --purge vsftpd
	echo 'vsftpd Removed!'

else

	echo 'vsftpd Remains'
	
fi

sudo dpkg -L john hydra nginx samba bind9 vsftpd tftpd x11vnc tightvncserver snmp nfs-kernel-server sendmail postfix xinetd

echo 'Purged'
