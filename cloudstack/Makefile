
#### Pick one of the these ISO to use, SL isn't tested.

### Centos from http://mirrors.seas.harvard.edu/centos/6/isos/x86_64/CentOS-6.5-x86_64-bin-DVD1.iso"
# image_basename=centos65
# ISO = CentOS-6.5-x86_64-bin-DVD1.iso
# ISO_CHECKSUM = 83221db52687c7b857e65bfe60787838
# ISO_CHECKSUM_TYPE = md5

### Scientific Linux
# image_basename=sl
# ISO = SL-65-x86_64-2013-12-16-Everything-DVD1.iso
# ISO_CHECKSUM = 2371b2c9f64911ca076bd6a812e30e0899687f13e5c9bcc3b5ff80111f154429
# ISO_CHECKSUM_TYPE = sha256



do-it :
	echo "Doing nothing, consider making: vmware or digitalocean."

vmware-iso:
	egrep -v '// |^ *$$' template.json+ > template.tmp
	rm -rf output-vmware-iso
	packer build \
            -only=vmware-iso \
	          -var ISO=$(ISO) \
            -var ISO_CHECKSUM=$(ISO_CHECKSUM) \
            -var ISO_CHECKSUM_TYPE=$(ISO_CHECKSUM_TYPE) \
            -var image_basename=$(image_basename) \
	    -var-file empty-credentials.json \
	    template.tmp
	find output-vmware-iso/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"8\"/config.version\ \=\ \"7\"/g" {} \;
	find output-vmware-iso/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"9\"/virtualhw.version\ \=\ \"7\"/g" {} \;
	find output-vmware-iso/. -name *.vmx -exec /Applications/VMware\ OVF\ Tool/ovftool -tt=OVA {} output-vmware-iso/centos-6.5-srv.ova \;
	find output-vmware-iso/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"7\"/config.version\ \=\ \"8\"/g" {} \;
	find output-vmware-iso/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"7\"/virtualhw.version\ \=\ \"9\"/g" {} \;

centos-6.5-qemu:
	rm -rf builds/qemu/centos-6.5-srv
	image_basename=centos-6.5-srv \
	iso=CentOS-6.5-x86_64-bin-DVD1.iso \
	iso_checksum=83221db52687c7b857e65bfe60787838 \
	iso_checksum_type=md5 \
	iso_url=http://fedora.is/CentOS/6.5/isos/x86_64/CentOS-6.5-x86_64-bin-DVD1.iso \
	timezone=GMT \
	bash CentOS-6.5-x86_64.sh

scientifc_linux-6.5-qemu:
	rm -rf builds/qemu/sl-6.5
	image_basename=sl-6.5 \
	iso=SL-65-x86_64-2014-01-27-Everything-DVD1.iso \
	iso_checksum=09bbe3dc354181568973ca352665d54a915594d5df275aca191dbf1d7f13b934 \
	iso_checksum_type=sha256 \
	iso_url=http://ftp.scientificlinux.org/linux/scientific/6.5/x86_64/iso/SL-65-x86_64-2014-01-27-Everything-DVD1.iso \
	timezone=GMT \
	kickstart_path=/sl-6.5/ks.cfg \
	bash CentOS-6.5-x86_64.sh

fedora-20-qemu:
	rm -rf builds/qemu/fedora-20
	image_basename=fedora-20 \
	iso=Fedora-20-x86_64-DVD.iso \
	iso_checksum=f2eeed5102b8890e9e6f4b9053717fe73031e699c4b76dc7028749ab66e7f917 \
	iso_checksum_type=sha256 \
	iso_url=http://fedora.is/fedora/releases/20/Fedora/x86_64/iso/Fedora-20-x86_64-DVD.iso \
	timezone=GMT \
	kickstart_path=/fedora-20/ks.cfg \
	bash CentOS-6.5-x86_64.sh

centos-6.5-vmware:
	rm -rf builds/vmware/centos-6.5-srv
	packer build \
	    -only=vmware-iso \
	    -var 'disk_size=160' \
	    CentOS-6.5-x86_64.json
	find builds/vmware/centos-6.5-srv/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"8\"/config.version\ \=\ \"7\"/g" {} \;
	find builds/vmware/centos-6.5-srv/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"9\"/virtualhw.version\ \=\ \"7\"/g" {} \;
	find builds/vmware/centos-6.5-srv/. -name *.vmx -exec /Applications/VMware\ OVF\ Tool/ovftool -tt=OVA {} builds/vmware/centos-6.5-srv/centos-6.5-srv.ova \;
	find builds/vmware/centos-6.5-srv/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"7\"/config.version\ \=\ \"8\"/g" {} \;
	find builds/vmware/centos-6.5-srv/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"7\"/virtualhw.version\ \=\ \"9\"/g" {} \;

sl-6.5-vmware:
	rm -rf builds/vmware/sl-6.5
	packer build \
	    -only=vmware-iso \
	    -var 'ISO=SL-65-x86_64-2014-01-27-Everything-DVD1.iso' \
	    -var 'ISO_URL=http://ftp.scientificlinux.org/linux/scientific/6.5/x86_64/iso/SL-65-x86_64-2014-01-27-Everything-DVD1.iso' \
	    -var 'ISO_CHECKSUM=09bbe3dc354181568973ca352665d54a915594d5df275aca191dbf1d7f13b934' \
	    -var 'ISO_CHECKSUM_TYPE=sha256' \
	    -var 'image_basename=sl-6.5' \
	    -var 'disk_size=160' \
	    -var 'kickstart_path=/sl-6.5/ks.cfg' \
	    CentOS-6.5-x86_64.json
	find builds/vmware/sl-6.5/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"8\"/config.version\ \=\ \"7\"/g" {} \;
	find builds/vmware/sl-6.5/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"9\"/virtualhw.version\ \=\ \"7\"/g" {} \;
	find builds/vmware/sl-6.5/. -name *.vmx -exec /Applications/VMware\ OVF\ Tool/ovftool -tt=OVA {} builds/vmware/sl-6.5/sl-6.5.ova \;
	find builds/vmware/sl-6.5/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"7\"/config.version\ \=\ \"8\"/g" {} \;
	find builds/vmware/sl-6.5/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"7\"/virtualhw.version\ \=\ \"9\"/g" {} \;

windows-2008-r2-vmware:
	rm -rf builds/vmware/windows-2008-r2-datacenter
	packer build -only=vmware-iso windows-2008-r2.json
	#find builds/vmware/windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"8\"/config.version\ \=\ \"7\"/g" {} \;
	#find builds/vmware/windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"9\"/virtualhw.version\ \=\ \"7\"/g" {} \;
	#find builds/vmware/windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/ethernet0.virtualdev\ \=\ \"e1000\"/ethernet0.virtualdev\ \=\ \"vmxnet3\"/g" {} \;
	#find builds/vmware/windows-2008-r2-datacenter/. -name *.vmx -exec /Applications/VMware\ OVF\ Tool/ovftool -tt=OVA {} builds/vmware/windows-2008-r2-datacenter/windows-2008-r2-datacenter.ova \;
	#find builds/vmware/windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"7\"/config.version\ \=\ \"8\"/g" {} \;
	#find builds/vmware/windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"7\"/virtualhw.version\ \=\ \"9\"/g" {} \;

windows-2008-r2-qemu:
	rm -rf builds/qemu/windows-2008-r2-datacenter
	packer build -only=qemu windows-2008-r2.json

coreos-stable-qemu:
	rm -rf builds/qemu/coreos*
	packer build -only=qemu coreos.json
	find builds/qemu/coreos* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find builds/qemu/coreos* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
