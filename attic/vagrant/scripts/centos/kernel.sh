#!/bin/sh

if [ x$GQ_ENVIRONMENT != x'production' ]; then
  # Add keys for elrepo
  echo "Adding rpm keys for elrepo"
  rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

  # Enable repo
  echo "Adding elrepe repository for CentOS 6.5"
  rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm

  # Install latest mainline kernel
  #echo "Installing mainline kernel from elrepo"
  # Main line
  # yum -y --enablerepo=elrepo-kernel install kernel-ml

  # Install latest longterm kernel
  # long term
  echo "Installing longterm kernel from elrepo"
  yum -y --enablerepo=elrepo-kernel install kernel-lt

  # Change default kernel
  echo "Channge default kernel on boot."
  sed -i -e 's/default=1/default=0/' /boot/grub/grub.conf
  sed -i -e 's/default=1/default=0/' /boot/grub/menu.lst

  # Reboot
  echo "Rebooting system to update kernel"
  sudo shutdown -r now

  # Sleep to delay execution of other scripts
  echo "Sleep to delay execution of other scripts"
  sleep 300
else
  echo "Building a box without longterm kernel"
fi