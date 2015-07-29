#!/bin/bash

echo "#### Starting on the GreenQloud addons"
echo "-----"
yum -y update
# disable screensaver
echo "sh -c 'setterm -blank 0 -powersave off -powerdown 0 < /dev/console > /dev/console 2>&1'" >> /etc/rc.local
#fix ec2-metadata
echo "NOZEROCONF=yes" >> /etc/sysconfig/network

wget http://s.greenqloud.com/template-scripts/qstack-agents/gq-create-ssh-keys -O /etc/rc.d/init.d/gq-create-ssh-keys
wget http://s.greenqloud.com/template-scripts/qstack-agents/gq-get-passwd -O /etc/rc.d/init.d/gq-get-passwd
wget http://s.greenqloud.com/template-scripts/qstack-agents/gq-get-ssh-keys -O /etc/rc.d/init.d/gq-get-ssh-keys
wget http://s.greenqloud.com/template-scripts/qstack-agents/gq-get-userdata -O /etc/rc.d/init.d/gq-get-userdata


chmod 755 /etc/rc.d/init.d/gq-create-ssh-keys
chmod 755 /etc/rc.d/init.d/gq-get-passwd
chmod 755 /etc/rc.d/init.d/gq-get-ssh-keys
chmod 755 /etc/rc.d/init.d/gq-get-userdata

ln -s /etc/rc.d/init.d/gq-create-ssh-keys /etc/rc.d/rc3.d/S50gq-create-ssh-keys
ln -s /etc/rc.d/init.d/gq-get-passwd /etc/rc.d/rc3.d/S50gq-get-passwd
ln -s /etc/rc.d/init.d/gq-get-ssh-keys /etc/rc.d/rc3.d/S50gq-get-ssh-keys
ln -s /etc/rc.d/init.d/gq-get-userdata /etc/rc.d/rc3.d/S50gq-get-userdata
ln -s /etc/rc.d/init.d/gq-create-ssh-keys /etc/rc.d/rc5.d/S50gq-create-ssh-keys
ln -s /etc/rc.d/init.d/gq-get-passwd /etc/rc.d/rc5.d/S50gq-get-passwd
ln -s /etc/rc.d/init.d/gq-get-ssh-keys /etc/rc.d/rc5.d/S50gq-get-ssh-keys
ln -s /etc/rc.d/init.d/gq-get-userdata /etc/rc.d/rc5.d/S50gq-get-userdata

echo "NETWORKING=yes" > /etc/sysconfig/network

cat > /etc/sysconfig/network-scripts/ifcfg-eth0 << EOF
DEVICE="eth0"
BOOTPROTO="dhcp"
NM_CONTROLLED="yes"
ONBOOT="yes"
EOF

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

echo "Installing VMWare Tools"
yum -y install perl
mkdir /mnt/vmware
mount -o loop linux.iso /mnt/vmware
cp /mnt/vmware/VMwareTools-*.tar.gz /tmp
umount /mnt/vmware
tar -zxf /tmp/VMwareTools-*.tar.gz -C /tmp
cd /
./tmp/vmware-tools-distrib/vmware-install.pl --default
rm -f /tmp/VMwareTools-*.tar.gz
rm -rf /tmp/vmware-tools-distrib

rm /etc/udev/rules.d/70-persistent-cd.rules
rm /etc/udev/rules.d/70-persistent-net.rules
#rm /root/.bash_history
rm /root/anaconda-ks.cfg
rm /root/install.log
rm /root/install.log.syslog
rm /root/ks-post.log
#rm /root/linux.iso

cat /dev/null > /var/log/anaconda.log
cat /dev/null > /var/log/anaconda.program.log
cat /dev/null > /var/log/anaconda.storage.log
cat /dev/null > /var/log/anaconda.syslog
cat /dev/null > /var/log/anaconda.ifcfg.log
cat /dev/null > /var/log/anaconda.yum.log
cat /dev/null > /var/log/audit/audit.log
cat /dev/null > /var/log/boot.log
cat /dev/null > /var/log/btmp
cat /dev/null > /var/log/cron
cat /dev/null > /var/log/dmesg
cat /dev/null > /var/log/dmesg.old
cat /dev/null > /var/log/lastlog
cat /dev/null > /var/log/maillog
cat /dev/null > /var/log/messages
cat /dev/null > /var/log/secure
cat /dev/null > /var/log/spooler
cat /dev/null > /var/log/tallylog
cat /dev/null > /var/log/wtmp
cat /dev/null > /var/log/yum.log

echo "#### GreenQloud addons done"
