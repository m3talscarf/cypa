#!/bin/bash


awk -F: '$3 >= 1000 && $3 < 65534 { print $1 }' /etc/passwd > /home/bob/Desktop/Ubuntun/test.txt
sed -i 's/$/:CyberSecure123!/' /home/bob/Desktop/Ubuntun/test.txt
sudo chpasswd < /home/bob/Desktop/Ubuntun/test.txt
