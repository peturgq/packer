# 10 gigs is default
disk_size=10240

do-it :
	@echo "Doing nothing, these are the targets available"
	@grep '^[^#[:space:]].*:' Makefile
	@echo " "
	@echo "disk_size:"
	@echo "10 gigs=10240 (default), 60 gigs=61440, 320 gigs=327680"

coreos-stable-qemu:
	rm -Rf output-coreos-stable
	packer build \
	-only=qemu \
	-var 'disk_size=$(disk_size)' \
	coreos-stable.json
	find output-coreos-stable/coreos-stable-$(disk_size)* -name coreos-stable-$(disk_size)* | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}.qcow2'
centos-7_0:
	rm -Rf output-centos-7.0
	packer build \
	-var 'disk_size=$(disk_size)' \
	centos-7.0.json
	find output-centos-7.0/centos-7.0-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-centos-7.0/centos-7.0-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
centos-7_0-legacygq:
	rm -Rf output-centos-7.0-legacygq
	packer build \
	-var 'disk_size=$(disk_size)' \
	centos-7.0-legacygq.json
	find output-centos-7.0-legacygq/centos-7.0-legacygq-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-centos-7.0-legacygq/centos-7.0-legacygq-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
debian-7_8:
	rm -Rf output-debian-7.8
	packer build \
	-var 'disk_size=$(disk_size)' \
	debian-7.8.json
	find output-debian-7.8/debian-7.8-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-debian-7.8/debian-7.8-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'




	





