#!/bin/bash

echo "Good!"

portsnap fetch update
portsnap extract

pkg install wget
pkg install gcc

wget http://46.149.18.253/freebsd/gq-create-ssh-keys -O /etc/rc.d/gq-create-ssh-keys
wget http://46.149.18.253/freebsd/gq-get-passwd -O /etc/rc.d/gq-get-passwd
wget http://46.149.18.253/freebsd/gq-get-ssh-keys -O /etc/rc.d/gq-get-ssh-keys
wget http://46.149.18.253/freebsd/gq-get-userdata -O /etc/rc.d/gq-get-userdata

chmod +x /etc/rc.d/gq-create-ssh-keys
chmod +x /etc/rc.d/gq-get-passwd
chmod +x /etc/rc.d/gq-get-ssh-keys
chmod +x /etc/rc.d/gq-get-userdata


# Created files for the FreeBSD templates. The post-installation needs to be worked on because the ssh login fails. I do not know if it's because the service is not up or what.
