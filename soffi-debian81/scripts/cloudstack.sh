#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install -y acpid ntp inetutils-ping locate screen
dpkg-reconfigure ntp

echo "acpiphp" >> /etc/modules
echo "sh -c 'setterm -blank 0 -powersave off -powerdown 0 < /dev/console > /dev/console 2>&1'" >> /etc/rc.local

rm -f /etc/udev/rules.d/70*
rm -f /var/lib/dhcp/dhclient.*

rm -f /etc/ssh/*key*

cat /dev/null > /var/log/wtmp 2>/dev/null
logrotate -f /etc/logrotate.conf 2>/dev/null
rm -f /var/log/*-* /var/log/*.gz 2>/dev/null

#This is done because otherwise the script that sets up the instance hostname will not run.
hostname localhost
rm /etc/hostname
touch /etc/hostname
echo "localhost" > /etc/hostname

#Force user to change the root password
#passwd --expire root

#Set up the init scripts
wget http://s.greenqloud.com/template-scripts/debian/7/gq-create-ssh-keys -O /etc/init.d/gq-create-ssh-keys
wget http://s.greenqloud.com/template-scripts/debian/7/baremetal/gq-get-passwd -O /etc/init.d/gq-get-passwd
wget http://s.greenqloud.com/template-scripts/debian/7/baremetal/gq-get-ssh-keys -O /etc/init.d/gq-get-ssh-keys
wget http://s.greenqloud.com/template-scripts/debian/7/baremetal/gq-get-userdata -O /etc/init.d/gq-get-userdata
wget http://s.greenqloud.com/template-scripts/debian/7/hostname -O /etc/dhcp/dhclient-exit-hooks.d/hostname

chmod 755 /etc/init.d/gq-create-ssh-keys
chmod 755 /etc/init.d/gq-get-passwd
chmod 755 /etc/init.d/gq-get-ssh-keys
chmod 755 /etc/init.d/gq-get-userdata
chmod 755 /etc/dhcp/dhclient-exit-hooks.d/hostname

ln -s /etc/init.d/gq-create-ssh-keys /etc/rc2.d/S18gq-create-ssh-keys
ln -s /etc/init.d/gq-get-passwd /etc/rc2.d/S18gq-get-passwd
ln -s /etc/init.d/gq-get-ssh-keys /etc/rc2.d/S18gq-get-ssh-keys 
ln -s /etc/init.d/gq-get-userdata /etc/rc2.d/S18gq-get-userdata

rm /root/.bash_history
rm /root/.lesshst
rm /root/.aptitude/config 
rmdir /root/.aptitude
rm /root/.bash_history 
rm /root/.viminfo 

history -c

