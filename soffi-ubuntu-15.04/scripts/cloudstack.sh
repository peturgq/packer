cat <<EOF > /etc/cloud/cloud.cfg.d/99_cloudstack.cfg
datasource:
  CloudStack: {}
  None: {}
datasource_list:
  - CloudStack
EOF

