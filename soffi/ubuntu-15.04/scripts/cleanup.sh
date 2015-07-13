sed -i -e "s,GRUB_CMDLINE_LINUX_DEFAULT=.*,GRUB_CMDLINE_LINUX_DEFAULT=\"text\",g" /etc/default/grub
update-grub
systemctl enable multi-user.target --force
systemctl set-default multi-user.target

