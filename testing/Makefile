# 10 gigs is default
disk_size=10240

do-it :
	@echo "Doing nothing, these are the targets available"
	@grep '^[^#[:space:]].*:' Makefile
	@echo " "
	@echo "disk_size:"
	@echo "10 gigs=10240 (default), 60 gigs=61440, 320 gigs=327680"

coreos-stable-qemu:
	packer build \
	-only=qemu \
	-var 'disk_size=$(disk_size)' \
	coreos-stable.json
	find output-coreos-stable/coreos-stable-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-coreos-stable/coreos-stable-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'



	





