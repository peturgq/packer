rm /etc/apt/sources.list.d/*
echo "deb http://ftp.debian.org/debian wheezy-backports main contrib non-free" > /etc/apt/sources.list.d/ftp_debian_org_debian.list

apt-get --yes update

apt-get --yes install -t wheezy-backports linux-image-amd64 linux-headers-amd64 qemu-kvm libvirt-bin libvirt-dev

# Reboot
#echo "Rebooting system to update kernel"
#sudo shutdown -r now

# Sleep to delay execution of other scripts
#echo "Sleep to delay execution of other scripts"
#sleep 300