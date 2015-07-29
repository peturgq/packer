# 10 gigs is default
disk_size=10240

do-it :
	@echo "Doing nothing, these are the targets available"
	@grep '^[^#[:space:]].*:' Makefile
	@echo " "
	@echo "disk_size:"
	@echo "10 gigs=10240 (default), 40 gigs=40960, 60 gigs=61440, 320 gigs=327680"

debian-8_1:
	rm -rf output-debian-8.1
	packer build \
	-var 'disk_size=$(disk_size)' \
	debian-8.1.json
	find output-debian-8.1/debian-8.1-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-debian-8.1/debian-8.1-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
windows-2012-standard-r2:
	rm -rf output-windows-2012-standard.r2
	# we need 'todos' because windows installer freaks out about unix line-endings in INF files..
	find . -name *.INF | xargs -I'{}' todos '{}'
	packer build \
	-var 'disk_size=$(disk_size)' \
	windows-2012-standard.r2.json
	find output-windows-2012-standard.r2/windows-2012-standard.r2-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-windows-2012-standard.r2/windows-2012-standard.r2-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
ubuntu-14_04:
	rm -rf output-ubuntu-14.04
	packer build \
	-var 'disk_size=$(disk_size)' \
	ubuntu-14.04.json
	find output-ubuntu-14.04/ubuntu-14.04-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-ubuntu-14.04/ubuntu-14.04-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
ubuntu-15_04:
	rm -rf output-ubuntu-15.04
	packer build \
	-var 'disk_size=$(disk_size)' \
	ubuntu-15.04.json
	find output-ubuntu-15.04/ubuntu-15.04-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-ubuntu-15.04/ubuntu-15.04-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'






