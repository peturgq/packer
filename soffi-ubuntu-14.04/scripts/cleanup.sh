sed -i -e "s,GRUB_CMDLINE_LINUX_DEFAULT=.*,GRUB_CMDLINE_LINUX_DEFAULT=\"text\",g" /etc/default/grub
update-grub
#systemctl enable multi-user.target --force
#systemctl set-default multi-user.target

# # Zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Make sure we wait until all the data is written to disk, otherwise
# Packer might quite too early
sync
