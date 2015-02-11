
do-it :
	echo "Doing nothing, consider making: vmware or digitalocean."

windows-2008-r2-vmware:
	rm -rf ../builds/vmware/Customer-windows-2008-r2-datacenter
	packer build -only=vmware-iso windows-2008-r2.json
	find ../builds/vmware/Customer-windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"8\"/config.version\ \=\ \"7\"/g" {} \;
	find ../builds/vmware/Customer-windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"9\"/virtualhw.version\ \=\ \"7\"/g" {} \;
	find ../builds/vmware/Customer-windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/ethernet0.virtualdev\ \=\ \"e1000\"/ethernet0.virtualdev\ \=\ \"vmxnet3\"/g" {} \;
	find ../builds/vmware/Customer-windows-2008-r2-datacenter/. -name *.vmx -exec /Applications/VMware\ OVF\ Tool/ovftool -tt=OVA {} ../builds/vmware/Customer-windows-2008-r2-datacenter/windows-2008-r2-datacenter.ova \;
	find ../builds/vmware/Customer-windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/config.version\ \=\ \"7\"/config.version\ \=\ \"8\"/g" {} \;
	find ../builds/vmware/Customer-windows-2008-r2-datacenter/. -name *.vmx -exec sed -i.bak "s/virtualhw.version\ \=\ \"7\"/virtualhw.version\ \=\ \"9\"/g" {} \;
