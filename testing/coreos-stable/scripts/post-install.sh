#!/bin/bash

cd /tmp

wget https://raw.githubusercontent.com/coreos/coreos-overlay/master/coreos-base/oem-cloudstack/files/cloud-config.yml
wget https://raw.githubusercontent.com/coreos/coreos-overlay/master/coreos-base/oem-cloudstack/files/cloudstack-coreos-cloudinit
wget https://raw.githubusercontent.com/coreos/coreos-overlay/master/coreos-base/oem-cloudstack/files/cloudstack-dhcp
wget https://raw.githubusercontent.com/coreos/coreos-overlay/master/coreos-base/oem-cloudstack/files/cloudstack-ssh-key
wget https://raw.githubusercontent.com/coreos/coreos-overlay/master/coreos-base/oem-cloudstack/files/coreos-setup-environment

sed -i 's/@@OEM_VERSION_ID@@/1.0/g' cloud-config.yml
chmod 775 cloudstack-coreos-cloudinit
chmod 775 cloudstack-dhcp
chmod 775 cloudstack-ssh-key
chmod 775 coreos-setup-environment

sudo mkdir -p /usr/share/oem/bin
sudo cp cloud-config.yml /usr/share/oem
sudo cp cloud* /usr/share/oem/bin
sudo cp coreos-setup-environment /usr/share/oem/bin

# remove the machine id. it will be regenerated on first boot.
sudo rm -fr /etc/machine-id

# nuke authorized_keys
echo "nuking keys"
sudo rm -Rf /home/core/.ssh/authorized_keys
sudo rm -Rf /home/core/.ssh/authorized_keys.d/*
echo "nuking userdata"
sudo rm -Rf /var/lib/coreos-install/user_data
