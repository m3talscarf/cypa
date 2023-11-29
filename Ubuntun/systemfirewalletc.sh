#!/bin/bash

chmod a+rwx ./systemfirewalletc

sudo apt-get install ufw
sudo ufw enable
sudo ufw status