apt-get update

# install deps for ubuntu cloud-init package
apt-get install -y cloud-utils dh-python distro-info distro-info-data euca2ools libmpdec2 libpython3-stdlib libpython3.4-minimal libpython3.4-stdlib libxslt1.1 python-cffi python-crypto python-cryptography python-distro-info python-ecdsa python-lxml python-ndg-httpsclient python-openssl python-paramiko python-ply python-pyasn1 python-pycparser python-requestbuilder python-requests python-setuptools python-urllib3 python-yaml python3 python3-chardet python3-configobj python3-crypto python3-jinja2 python3-json-pointer python3-jsonpatch python3-jwt python3-markupsafe python3-minimal python3-oauthlib python3-pkg-resources python3-prettytable python3-requests python3-serial python3-six python3-urllib3 python3-yaml python3.4 python3.4-minimal cloud-utils dh-python distro-info distro-info-data euca2ools libmpdec2 libpython3-stdlib libpython3.4-minimal libpython3.4-stdlib libxslt1.1 python-cffi python-crypto python-cryptography python-distro-info python-ecdsa python-lxml python-ndg-httpsclient python-openssl python-paramiko python-ply python-pyasn1 python-pycparser python-requestbuilder python-requests python-setuptools python-urllib3 python-yaml python3 python3-chardet python3-configobj python3-crypto python3-jinja2 python3-json-pointer python3-jsonpatch python3-jwt python3-markupsafe python3-minimal python3-oauthlib python3-pkg-resources python3-prettytable python3-requests python3-serial python3-six python3-urllib3 python3-yaml python3.4 python3.4-minimal

# install cloud-init 0.7.7 from ubuntu while not packaged for debian8, later this can be done normally
curl -O http://launchpadlibrarian.net/208765957/cloud-init_0.7.7~bzr1091-0ubuntu3_all.deb
dpkg -i cloud-init_0.7.7~bzr1091-0ubuntu3_all.deb

cat <<EOF > /etc/cloud/cloud.cfg.d/99_cloudstack.cfg
datasource:
  CloudStack: {}
  None: {}
datasource_list:
  - CloudStack
EOF

# remove ubuntu'isms from cloud.cfg
sed -i 's/set-passwords/[ set-passwords, always ]/' /etc/cloud/cloud.cfg
sed -i 's/lock_passwd: True/lock_passwd: False/' /etc/cloud/cloud.cfg
#sed -i 's/ - default//' /etc/cloud/cloud.cfg
#sed -i 's/users://' /etc/cloud/cloud.cfg
sed -i 's/name: ubuntu/name: root/' /etc/cloud/cloud.cfg
sed -i 's/disable_root: true/disable_root: false/' /etc/cloud/cloud.cfg 
echo apt_preserve_sources_list: true >> /etc/cloud/cloud.cfg
