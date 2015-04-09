#!/bin/bash

#Update the system, all questions answered with a yes
yum -y update

#By default, eth0 doesn't get up on boot we must change the configuration
#/etc/sysconfig/network-scripts/ifcfg-eth0
rm /etc/sysconfig/network-scripts/ifcfg-eth0
touch /etc/sysconfig/network-scripts/ifcfg-eth0
echo "DEVICE=eth0" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "TYPE=Ethernet" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "NM_CONTROLLED=yes" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "BOOTPROTO=dhcp" >> /etc/sysconfig/network-scripts/ifcfg-eth0

#Also this command is needed in order to have the networking set up properly
chkconfig network on

## Begin: Needed in case the machine ever gets cloned in any way
cat > /etc/init.d/remove-net-rules << EOF
#!/bin/bash
# GQ: Resets the udev net rules requred in case the machine gets cloned.
rm -f /etc/udev/rules.d/70-persistent-net.rules
EOF

# Make the script executable
chmod 755 /etc/init.d/remove-net-rules
# Shutdown 0
ln -s /etc/init.d/remove-net-rules /etc/rc0.d/S00remove-net-rules
# Reboot 6
ln -s /etc/init.d/remove-net-rules /etc/rc6.d/S00remove-net-rules
## End of Remove udev Net Rules

yum -y install wget

# copy qstack files over
cp -r /tmp/template-files/* /

#wget "http://s.greenqloud.com/template-scripts/centos/6.5/gq-create-ssh-keys" -O /etc/rc.d/init.d/gq-create-ssh-keys
#wget "http://s.greenqloud.com/template-scripts/centos/6.5/gq-get-passwd" -O /etc/rc.d/init.d/gq-get-passwd
#wget "http://s.greenqloud.com/template-scripts/centos/6.5/gq-get-ssh-keys" -O /etc/rc.d/init.d/gq-get-ssh-keys
#wget "http://s.greenqloud.com/template-scripts/centos/6.5/gq-get-userdata" -O /etc/rc.d/init.d/gq-get-userdata

chmod 755 /etc/rc.d/init.d/gq-create-ssh-keys
chmod 755 /etc/rc.d/init.d/gq-get-passwd
chmod 755 /etc/rc.d/init.d/gq-get-ssh-keys
chmod 755 /etc/rc.d/init.d/gq-get-userdata

ln -s /etc/rc.d/init.d/gq-create-ssh-keys /etc/rc.d/rc3.d/S50gq-create-ssh-keys
ln -s /etc/rc.d/init.d/gq-create-ssh-keys /etc/rc.d/rc5.d/S50gq-create-ssh-keys

ln -s /etc/rc.d/init.d/gq-get-passwd /etc/rc.d/rc3.d/S50gq-get-passwd
ln -s /etc/rc.d/init.d/gq-get-passwd /etc/rc.d/rc5.d/S50gq-get-passwd

ln -s /etc/rc.d/init.d/gq-get-ssh-keys /etc/rc.d/rc3.d/S50gq-get-ssh-keys
ln -s /etc/rc.d/init.d/gq-get-ssh-keys /etc/rc.d/rc5.d/S50gq-get-ssh-keys

ln -s /etc/rc.d/init.d/gq-get-userdata /etc/rc.d/rc3.d/S50gq-get-userdata
ln -s /etc/rc.d/init.d/gq-get-userdata /etc/rc.d/rc5.d/S50gq-get-userdata

rm /etc/udev/rules.d/70-persistent-cd.rules
rm /etc/udev/rules.d/70-persistent-net.rules

rm /root/.bash_history
rm /root/anaconda-ks.cfg
rm /root/install.log
rm /root/install.log.syslog
rm /root/ks-post.log

rm /var/log/*
rm -R /var/log/*
