#disk_size=10
# 10 gigs
#disk_size=10240
# 60 gigs
#disk_size=61440
# 320 gigs
disk_size=327680

do-it :
	echo "Doing nothing, consider making: windows-2012-R2-standard-amd64"
	echo "you can pass in vars like:"
	echo "disk_size="

windows-2012-R2-standard-amd64:
	rm -rf builds/qemu/coreos*
	packer build \
	-var 'disk_size=$(disk_size)' \
	windows-2012-R2-standard-amd64.json

#find output-soffi-windows-2012-standard-r2/coreos* -name *.qcow2 | xargs -I'{}' qemu-img convert -f qcow2 -O qcow2 '{}' '{}-new'
#find soffi-windows-2012-standard-r2/coreos* -name *.qcow2 | xargs -I'{}' mv '{}'-new '{}'
