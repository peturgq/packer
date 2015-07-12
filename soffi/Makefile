#disk_size=10
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
windows-2012-standard-r2:
	rm -rf output-debian-8.1
	packer build \
	-var 'disk_size=$(disk_size)' \
	windows-2012-standard.r2.json






#find output-soffi-windows-2012-standard-r2/coreos* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
#find soffi-windows-2012-standard-r2/coreos* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
