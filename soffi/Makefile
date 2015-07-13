# 10 gigs
disk_size=10240

# 60 gigs
#disk_size=61440

# 320 gigs
#disk_size=327680

do-it :
	@echo "Doing nothing, these are the targets available"
	@grep '^[^#[:space:]].*:' Makefile

debian-8_1:
	rm -rf output-debian-8.1
	packer build \
	-var 'disk_size=$(disk_size)' \
	debian-8.1.json
	find output-debian-8.1/packer* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-debian-8.1/packer* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
windows-2012-standard-r2:
	rm -rf output-windows-2012-standard.r2
	packer build \
	-var 'disk_size=$(disk_size)' \
	windows-2012-standard.r2.json
	find output-windows-2012-standard.r2/packer* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-windows-2012-standard.r2/packer* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
ubuntu-14_04:
	rm -rf output-ubuntu-14.04
	packer build \
	-var 'disk_size=$(disk_size)' \
	ubuntu-14.04.json
	find output-ubuntu-14.04/packer* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-ubuntu-14.04/packer* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
ubuntu-15_04:
	rm -rf output-ubuntu-15.04
	packer build \
	-var 'disk_size=$(disk_size)' \
	ubuntu-15.04.json
	find output-ubuntu-15.04/packer* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-ubuntu-15.04/packer* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'






#find output-soffi-windows-2012-standard-r2/coreos* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
#find soffi-windows-2012-standard-r2/coreos* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
