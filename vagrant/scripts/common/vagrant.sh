#!/bin/bash

adduser vagrant
echo vagrant:vagrant | chpasswd

mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh


mkdir /root/.ssh
wget --no-check-certificate \
    'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
    -O /root/.ssh/authorized_keys
chown -R root /root/.ssh
chmod -R go-rwsx /root/.ssh
