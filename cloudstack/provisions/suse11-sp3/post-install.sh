#!/bin/bash

zypper refresh

zypper install vim
zypper install wget

#Set the clock to sync using ntp.
mv /etc/ntp.conf /etc/ntp.conf.bk
touch /etc/ntp.conf
echo "server 0.pool.ntp.org" >> /etc/ntp.conf
echo "server 1.pool.ntp.org" >> /etc/ntp.conf
echo "server 2.pool.ntp.org" >> /etc/ntp.conf
echo "server 3.pool.ntp.org" >> /etc/ntp.conf

chkconfig ntp on
service ntp start
service ntp restart
ntpq -p

#Download the gq scripts
wget http://192.168.3.253/tmpl/suse11/gq-create-ssh-keys -O /etc/rc.d/gq-create-ssh-keys
wget http://192.168.3.253/tmpl/suse11/gq-get-passwd -O /etc/rc.d/gq-get-passwd
wget http://192.168.3.253/tmpl/suse11/gq-get-ssh-keys -O /etc/rc.d/gq-get-ssh-keys
wget http://192.168.3.253/tmpl/suse11/gq-get-userdata -O /etc/rc.d/gq-get-userdata

chmod a+x /etc/rc.d/gq-*

#Add the symlinks
ln -s /etc/rc.d/gq-create-ssh-keys /etc/rc.d/rc3.d/S50gq-create-ssh-keys
ln -s /etc/rc.d/gq-create-ssh-keys /etc/rc.d/rc5.d/S50gq-create-ssh-keys

ln -s /etc/rc.d/gq-get-passwd /etc/rc.d/rc3.d/S50gq-get-passwd
ln -s /etc/rc.d/gq-get-passwd /etc/rc.d/rc5.d/S50gq-get-passwd

ln -s /etc/rc.d/gq-get-ssh-keys /etc/rc.d/rc3.d/S50gq-get-ssh-keys 
ln -s /etc/rc.d/gq-get-ssh-keys /etc/rc.d/rc5.d/S50gq-get-ssh-keys

ln -s /etc/rc.d/gq-get-userdata /etc/rc.d/rc3.d/S50gq-get-userdata
ln -s /etc/rc.d/gq-get-userdata /etc/rc.d/rc5.d/S50gq-get-userdata

userdel -r suse

rm /var/log/*
rm -R /var/log/*

rm /tmp/*
rm -R /tmp/*

rm /root/.bash_history
touch /root/.bash_history

rm /root/.viminfo
touch /root/.viminfo

#Delete the ssh keys
rm -f /etc/ssh/ssh_host_*
