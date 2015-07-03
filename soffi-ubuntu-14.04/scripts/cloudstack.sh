cat <<EOF > /etc/cloud/cloud.cfg.d/99_cloudstack.cfg
datasource:
  CloudStack: {}
  None: {}
datasource_list:
  - CloudStack
EOF
sed -i 's/set-passwords/[ set-passwords, always ]/' /etc/cloud/cloud.cfg
sed -i 's/lock_passwd: True/lock_passwd: False/' /etc/cloud/cloud.cfg
