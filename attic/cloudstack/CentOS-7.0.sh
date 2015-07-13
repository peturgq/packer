#!/usr/bin/env bash

function usage
{
    echo "Script for builing CentOS 7.0 images"
    echo "Custumize with enviroment parameters"
    echo "See below...."
    echo "image_basename=sl-6.5 \\"
    echo "iso=SL-65-x86_64-2014-01-27-Everything-DVD1.iso \\"
    echo "iso_checksum=09bbe3dc354181568973ca352665d54a915594d5df275aca191dbf1d7f13b934 \\"
    echo "iso_checksum_type=sha256 \\"
    echo "iso_url=http://ftp1.scientificlinux.org/linux/scientific/6.4/x86_64/iso/SL-64-x86_64-2013-03-21-Everything-DVD1.iso \\"
    echo "timezone=GMT \\"
    echo "bash CentOS-7.0.sh\\"
}

while [ "$1" != "" ]; do
    case $1 in
        # --image_basename )      shift
        #                         image_basename=$1
        #                         ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                #exit 1
    esac
    shift
done

: ${image_basename:=centos-7.0-srv}
: ${iso:=CentOS-7.0-1406-x86_64-DVD.iso}
: ${iso_checksum:=713ea7847adcdd1700e92429f212721a}
: ${iso_checksum_type:=md5}
: ${iso_url:=http://images.greenqloud.com/CentOS-7.0-1406-x86_64-DVD.iso}
: ${timezone:=GMT}
: ${kickstart_path:=/centos-7.0/ks.cfg}

echo 'Building image'
echo 'Image basename = ' $image_basename
echo 'ISO = ' $iso
echo 'ISO_CHECKSUM = ' $iso_checksum
echo 'ISO_URL = ' $iso_url
echo 'TIMEZONE = ' $timezone

declare -A swap_size

swap_size=( ["10"]="512" ["20"]="1024" ["40"]="2048" ["80"]="4096" ["160"]="4096" ["320"]="4096" ["640"]="9216" )

sed -i.bak -e "s/timezone\ .*/timezone\ $timezone/" http_directory/centos-7.0/ks.cfg

for size in "${!swap_size[@]}"; do
    echo "Creating image with size $size and swap_size ${swap_size["$size"]}";
    echo "Changing ks.cfg swap to ${swap_size["$size"]}"
    sed -i.bak -e "s/logvol\ swap\ --fstype\ swap\ --name\=swap\ --vgname\=vg0\ --size\ .*/logvol\ swap\ --fstype\ swap\ --name\=swap\ --vgname\=vg0\ --size\ ${swap_size["$size"]}/" http_directory/centos-7.0/ks.cfg
    packer build \
      -only=qemu \
      -var image_basename=$image_basename \
      -var disk_size=$size \
      -var kickstart_path=$kickstart_path \
      -var ISO=$iso \
      -var ISO_CHECKSUM=$iso_checksum \
      -var ISO_CHECKSUM_TYPE=$iso_checksum_type \
      -var ISO_URL=$iso_url \
      CentOS-7.0.json
      echo 'Building image'
      echo 'Image basename = ' $image_basename
      echo 'ISO = ' $iso
      echo 'ISO_CHECKSUM = ' $iso_checksum
      echo 'ISO_URL = ' $iso_url
      echo 'TIMEZONE = ' $timezone
done

echo "Setting swap in ks.cfg back to 512mb"
sed -i.bak -e 's/logvol\ swap\ --fstype\ swap\ --name\=swap\ --vgname\=vg0\ --size\ .*/logvol\ swap\ --fstype\ swap\ --name\=swap\ --vgname\=vg0\ --size\ 512/' http_directory/centos-7.0/ks.cfg

echo "Done"
