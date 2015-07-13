#!/bin/sh

if [ x$GQ_ENVIRONMENT != x'production' ]; then
  echo "Installing kernel development module and headers"
  yum -y --enablerepo=elrepo-kernel install kernel-lt-devel

  echo "removing previus headers"
  yum -y erase kernel-headers
  echo "Installing new kernel headers"
  yum -y --enablerepo=elrepo-kernel install kernel-lt-headers

  echo "Installing development tools for centos"
  yum -y groupinstall "Development Tools"

  # Reboot
  echo "Rebooting system to update kernel"
  sudo shutdown -r now

  # Sleep to delay execution of other scripts
  echo "Sleep to delay execution of other scripts"
  sleep 300
else
  echo "Building a box without longterm kernel"
fi