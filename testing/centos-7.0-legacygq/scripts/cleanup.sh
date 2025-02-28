#!/bin/sh
# update packages
yum -y update

# Remove Linux headers
yum -y remove gcc kernel-devel kernel-headers
yum -y clean all

# Remove Virtualbox specific files
rm -rf /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*
rm -rf *.iso *.iso.? /tmp/vbox /home/vagrant/.vbox_version

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# Cleanup ssh host keys
rm -f /etc/ssh/ssh_host_*key*

# remove under tmp directory
rm -rf /tmp/*

rm -f /etc/udev/rules.d/70-persistent-net.rules
sed -i '/^UUID/d'   /etc/sysconfig/network-scripts/ifcfg-enp0s3
sed -i '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-enp0s3

# stop network and remove leases
echo "Removing old leases file"
rm -Rf /var/lib/NetworkManager/*

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
