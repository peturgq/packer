# 10 gigs is default
disk_size=10240

do-it :
	@echo "Doing nothing, these are the targets available"
	@grep '^[^#[:space:]].*:' Makefile
	@echo " "
	@echo "disk_size:"
	@echo "10 gigs=10240 (default), 60 gigs=61440, 320 gigs=327680"

windows-2012-standard-updates-r2:
	rm -rf output-windows-2012-standard-updates.r2
	# we need 'todos' because windows installer freaks out about unix line-endings in INF files..
	find . -name *.INF | xargs -I'{}' todos '{}'
	packer build \
	-var 'disk_size=$(disk_size)' \
	windows-2012-standard-updates.r2.json
	find output-windows-2012-standard-updates.r2/windows-2012-standard-updates.r2-$(disk_size)* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
	find output-windows-2012-standard-updates.r2/windows-2012-standard-updates.r2-$(disk_size)* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'






