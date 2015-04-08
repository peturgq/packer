#!/bin/bash

apt-get update
apt-get -y upgrade
7
apt-get install -y acpiphp
echo "acpiphp" >> /etc/modules

sed -i "s/exit 0//" /etc/rc.local
echo "sh -c 'setterm -blank 0 -powersave off -powerdown 0 < /dev/console > /dev/console 2>&1'" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

apt-get install -y vim
apt-get install -y curl
apt-get install -y wget

rm /etc/network/if-up.d/avahi-autoipd

# qstack common files
mkdir -p /usr/local/qstack/
cp -r /tmp/qstack-files/* /usr/local/qstack/

# copy uploaded template files
function move_file {
    FNAME=$1
    echo "Installing $FNAME"
    mkdir -p `dirname /$FNAME`
    cp -r /tmp/template-files/$FNAME /$FNAME
}

move_file "/etc/dhcp/dhclient-exit-hooks.d/hostname"
move_file "/etc/init/gq-create-ssh-keys.conf"
move_file "/etc/init/gq-get-ssh-keys.conf"
move_file "/etc/init/gq-get-userdata.conf"
move_file "/etc/init.d/gq-get-passwd"
move_file "/etc/init.d/gq-get-ssh-keys"

chmod 755 /etc/init.d/gq-get-passwd
chmod 755 /etc/init.d/gq-get-ssh-keys

update-rc.d gq-get-passwd defaults
update-rc.d gq-get-ssh-keys defaults

rm /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_dsa_key.pub
rm /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_ecdsa_key.pub
rm /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key.pub
rm /var/cache/apt/*.bin

rm /var/log/*
rm -R /var/log/*

rm /root/.aptitude/config
rm /root/.bash_history
rm /root/.viminfo

rm /home/ubuntu/.bash_history
rm /home/ubuntu/.cache/motd.legal-displayed
rm -R /home/ubuntu/.cache
rm /home/ubuntu/.sudo_as_admin_successful
rm /home/ubuntu/.viminfo
rm /tmp/smu2
rm /tmp/ssh_host_dsa_key*
rm /tmp/ssh_host_dsa_key
rm /tmp/ssh_host_dsa_key.pub
rm /tmp/ssh_host_ecdsa_key
rm /tmp/ssh_host_ecdsa_key.pub
rm /tmp/ssh_host_rsa_key
rm /tmp/ssh_host_rsa_key.pub

history -c
exit 0
