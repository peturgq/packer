#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install -y acpiphp
sudo echo "acpiphp" >> /etc/modules

sudo sed -i "s/exit 0//" /etc/rc.local
sudo echo "sh -c 'setterm -blank 0 -powersave off -powerdown 0 < /dev/console > /dev/console 2>&1'" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

sudo apt-get install -y vim
sudo apt-get install -y curl
sudo apt-get install -y wget

sudo rm /etc/network/if-up.d/avahi-autoipd

sudo wget http://192.168.3.253/tmpl/ubuntu14/hostname -O /etc/dhcp/dhclient-exit-hooks.d/hostname
sudo wget http://192.168.3.253/tmpl/ubuntu14/gq-create-ssh-keys.conf -O /etc/init/gq-create-ssh-keys.conf
sudo wget http://192.168.3.253/tmpl/ubuntu14/gq-get-passwd.conf -O /etc/init/gq-get-passwd.conf
sudo wget http://192.168.3.253/tmpl/ubuntu14/gq-get-ssh-keys.conf -O /etc/init/gq-get-ssh-keys.conf
sudo wget http://192.168.3.253/tmpl/ubuntu14/gq-get-userdata.conf -O /etc/init/gq-get-userdata.conf
sudo wget http://192.168.3.253/tmpl/ubuntu14/gq-get-passwd -O /etc/init.d/gq-get-passwd
sudo wget http://192.168.3.253/tmpl/ubuntu14/gq-get-ssh-keys -O /etc/init.d/gq-get-ssh-keys

sudo chmod 755 /etc/init.d/gq-get-passwd 
sudo chmod 755 /etc/init.d/gq-get-ssh-keys

sudo update-rc.d gq-get-passwd defaults
sudo update-rc.d gq-get-ssh-keys defaults

sudo rm /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_dsa_key.pub
sudo rm /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_ecdsa_key.pub
sudo rm /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key.pub
sudo rm /var/cache/apt/*.bin

sudo rm /var/log/*
sudo rm -R /var/log/*

sudo rm /root/.aptitude/config
sudo rm /root/.bash_history
sudo rm /root/.viminfo

sudo rm /home/ubuntu/.bash_history 
sudo rm /home/ubuntu/.cache/motd.legal-displayed 
sudo rm -R /home/ubuntu/.cache
sudo rm /home/ubuntu/.sudo_as_admin_successful 
sudo rm /home/ubuntu/.viminfo 
sudo rm /tmp/smu2
sudo rm /tmp/ssh_host_dsa_key*
sudo rm /tmp/ssh_host_dsa_key
sudo rm /tmp/ssh_host_dsa_key.pub
sudo rm /tmp/ssh_host_ecdsa_key
sudo rm /tmp/ssh_host_ecdsa_key.pub 
sudo rm /tmp/ssh_host_rsa_key
sudo rm /tmp/ssh_host_rsa_key.pub 

ubuntu_pass=`sudo cat /etc/shadow | awk -F: '/ubuntu/ {print $2}'`
echo "Password before substitution: "
echo $ubuntu_pass
sudo sed -i "s#$ubuntu_pass#*#" /etc/shadow

history -c && sudo halt -p  
